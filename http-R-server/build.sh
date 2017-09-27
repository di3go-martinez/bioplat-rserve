#!/bin/bash

mode=${1?"Falta el mode dev|prod"}

set -e

function check-file-exists(){
	file2check="$1"
	if [ ! -e "$file2check"  ]; then
		echo "$file2check no encontrado"
		exit 1
	fi
}

check-file-exists webapps-$mode/R4JServer.war
check-file-exists build/bioplatR-*.tar.gz

docker build \
	-t http-r-server:${mode//dev/latest} .
