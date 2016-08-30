
[ -e apache-tomcat-7.0.65.tar.gz ] || echo "no está el tomcat" && exit 1 
[ -e bioplatR-1.0.tar.gz ] || exit 2 
[ -e jre-7u45-linux-x64.tar.gz ] || exit 3 

docker build -t http-r-server .
