from bioplat-r-dependencies
maintainer bioplat

RUN apt-get update 
RUN apt-get install -y curl
RUN apt-get install -y openjdk-8-jre && \
  rm -rf /var/lib/apt/lists/
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
#FIXME definir link simbólico /opt/jre lo usan los sh revisar
run ["ln","-s","/usr/lib/jvm/java-8-openjdk-amd64", "/opt/jre"]

run ["curl", "https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.65/bin/apache-tomcat-7.0.65.tar.gz", "-o","/tmp/tomcat.tgz"]
run ["mkdir", "/opt/tomcat/"]
run ["tar", "xf", "/tmp/tomcat.tgz", "-C", "/opt/tomcat/", "--strip-components=1"]
run ["rm", "-f", "/tmp/tomcat.tgz"]
volume webapps /opt/tomcat/webapps
copy tomcat-mods/conf/server.xml /opt/tomcat/conf/server.xml
copy tomcat-mods/conf/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
#configuro el directorio de logs

volume /r/logs/
run ["rmdir", "/opt/tomcat/logs"]
run ["ln", "-s", "/r/logs/tomcat-logs", "logs"]
run ["mv", "logs", "/opt/tomcat/"]


add init-rserve.sh /r/init-rserve.sh
add load-libs.r /r/load-libs.r
add entrypoint.sh /r/entrypoint.sh

copy build/bioplatR-1.0.tar.gz /r/bioplatR.tar.gz
run ["R", "CMD", "INSTALL", "/r/bioplatR.tar.gz"]


entrypoint ["/r/entrypoint.sh"]
#para pruebas 
#cmd ["/bin/bash"]
