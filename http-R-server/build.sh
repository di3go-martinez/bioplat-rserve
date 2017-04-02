#!/bin/bash

set -e

function check-file-exists(){
	file2check="$1"
	if [ ! -e "$file2check"  ]; then
		echo "$file2check no encontrado"
		exit 1
	fi
}

check-file-exists webapps/R4JServer.war
check-file-exists build/apache-tomcat-7.0.65.tar.gz 
check-file-exists build/jre-7u45-linux-x64.tar.gz
check-file-exists build/bioplatR-1.0.tar.gz

[ -e apache-tomcat-7.0.65.tar.gz ] || echo "no está el tomcat" && exit 1 
[ -e bioplatR-1.0.tar.gz ] || exit 2 
[ -e jre-7u45-linux-x64.tar.gz ] || exit 3 

docker build -t http-r-server .
