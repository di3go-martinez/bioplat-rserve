from bioplat-r-dependencies
maintainer bioplat

RUN apt-get update 
RUN apt-get install -y curl
RUN apt-get install -y logrotate
RUN apt-get install -y openjdk-8-jre && \
  rm -rf /var/lib/apt/lists/
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
#FIXME definir link simbólico /opt/jre lo usan los sh revisar
run ln -s /usr/lib/jvm/java-8-openjdk-amd64 /opt/jre

run curl https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.81/bin/apache-tomcat-7.0.81.tar.gz -o /tmp/tomcat.tgz && \
    mkdir /opt/tomcat/ && \
    tar xf /tmp/tomcat.tgz -C /opt/tomcat/ --strip-components=1 && \
    rm -f /tmp/tomcat.tgz 
volume webapps /opt/tomcat/webapps
copy tomcat-mods/conf/server.xml /opt/tomcat/conf/server.xml
copy tomcat-mods/conf/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

#configuro el directorio de logs
volume /r/logs/tomcat-logs
run rmdir /opt/tomcat/logs && \
    ln -s /r/logs/tomcat-logs logs && \
    mv logs /opt/tomcat/
#configuro logrotate
copy tomcat.logrotate.conf /etc/logrotate.d/tomcat

add Rserv.conf /etc/Rserv.conf
#add init-rserve-simple.sh /r/init-rserve.sh
add start.r /r/init-rserve.sh
add load-libs.r /r/load-libs.r
add entrypoint.sh /r/entrypoint.sh

#esto no sirve para produccion!
copy build/bioplatR-dev.tar.gz /r/bioplatR.tar.gz

#produccion
#copy build/bioplatR-prod.tar.gz /r/bioplatR.tar.gz

run R CMD INSTALL /r/bioplatR.tar.gz


entrypoint ["/r/entrypoint.sh"]
#para pruebas 
#cmd ["/bin/bash"]
