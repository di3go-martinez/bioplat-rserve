#!/bin/bash

#corta ante el primer error
set -e 

export JRE_HOME=/opt/jre/
export CATALINA_OPTS="-Dr4j.r.home=/usr/lib/R/bin/"

/r/init-rserve.sh start

/opt/tomcat/bin/startup.sh

logfile="$(readlink -f /opt/tomcat/logs/catalina.out)"
tail -f "$logfile"


