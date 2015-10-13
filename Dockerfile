# Set the base image 
FROM di3gomartinez/rserve-bioplat-2
MAINTAINER diego martínez


#USER root
#ssh
#RUN apt-get update && apt-get install -y openssh-server
#RUN mkdir -p /var/run/sshd
#RUN echo 'root:Root.1' | chpasswd
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

#ENV NOTVISIBLE "in users profile"
#RUN echo "export VISIBLE=now" >> /etc/profile
#expose 22
#run /usr/sbin/sshd &

run mkdir /tmp/logs
EXPOSE 6311
USER r
WORKDIR /home/r
ADD start.sh fixed_start
CMD ["sh", "./fixed_start"]
