from bioplat-r-dependencies
maintainer bioplat


copy build/apache-tomcat-7.0.65.tar.gz /tmp/tomcat.tgz
run ["mkdir", "/opt/tomcat/"]
run ["tar", "xf", "/tmp/tomcat.tgz", "-C", "/opt/tomcat/", "--strip-components=1"]
run ["rm", "-f", "/tmp/tomcat.tgz"]
volume webapps /opt/tomcat/webapps
copy tomcat-mods/conf/server.xml /opt/tomcat/conf/server.xml
copy tomcat-mods/conf/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

copy build/jre-7u45-linux-x64.tar.gz /tmp/jre.tgz
run ["mkdir", "/opt/jre/"]
run ["tar", "xf", "/tmp/jre.tgz","-C","/opt/jre/", "--strip-components=1"]
run ["rm", "-f", "/tmp/jre.tgz"]

add init-rserve.sh /r/init-rserve.sh
add load-libs.r /r/load-libs.r
add entrypoint.sh /r/entrypoint.sh

copy build/bioplatR-1.0.tar.gz /r/bioplatR.tar.gz
run ["R", "CMD", "INSTALL", "/r/bioplatR.tar.gz"]


entrypoint ["/r/entrypoint.sh"]
#cmd ["/bin/bash"]
