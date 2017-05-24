#!/bin/bash

set -e
set -u

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#remuevo versiones con nombres viejos del paquete
apt-get -y remove docker docker-engine

apt-get -y update
apt-get -y install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
calculated_key_fingerprint=$(sudo apt-key fingerprint 0EBFCD88 | grep fingerprint | cut -d= -f2)

DOCKER_KEY_FINGERPRINT=" 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"
if [ "$calculated_key_fingerprint" == "$DOCKER_KEY_FINGERPRINT"  ];then
  echo "Apt-key OK"
else
  echo "warning apt-key: $calculated_key_fingerprint is not equal to $DOCKER_KEY_FINGERPRINT"
fi 

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


apt-get -y update

apt-get -y purge lxc-docker

#necesario para 14.04
#apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual

apt-get -y install docker-ce

service docker start

systemctl enable docker

#Test installed docker
docker run --rm hello-world

docker rmi hello-world

#Creo al usuario bioplat si no existe
username="bioplat"
if ! egrep "^$username" /etc/passwd >/dev/null; then
  password="Bioplat.1"
  encrypted_password=$(perl -e 'print crypt($ARGV[0], "password-salt")' $password)
  useradd --create-home --password $encrypted_password $username
  [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
fi

echo "Agregando a Bioplat al grupo docker. Es necesario relogin"
addgroup bioplat docker


#extras
#docker-compose
curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
/usr/local/bin/docker-compose --version

#bash completion configuration
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

#muevo el repositorio al home de bioplat
#me muevo al home del repo primero
cd "$(dirname $(readlink -f $0))"
#me muevo un paso para arriba para poder mover el repositorio
cd ..
#borrar si existe ya el repo
if [ -e /home/$username/bioplat-rserve ];then
  rm -ir /home/$username/bioplat-rserve
fi
[ $? == 0 ] || exit 1
#hago cp para poder correr este script de nuevo...
cp -r bioplat-rserve /home/$username/
chown -R $username:$username /home/$username/bioplat-rserve

echo "login con el usuario $username y correr /home/$username/rserve-bioplat/build.and.run"
