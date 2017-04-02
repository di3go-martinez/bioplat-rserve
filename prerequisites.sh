#!/bin/bash

set -e

alias apt-get="apt-get -y"

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

apt-get update
apt-get install apt-transport-https ca-certificates

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list

apt-get update

apt-get purge lxc-docker

apt-cache policy docker-engine

apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

apt-get install docker-engine

service docker start

systemctl enable docker

unalias apt-get

echo "Agregando a Bioplat al grupo docker. Es necesario relogin"
addgroup bioplat docker
