#!/bin/bash

## Variables
LOGFILE="/r/rserve.log"
##CONFIGFILE="/etc/Rserv.conf"


# Rserve configs
RBIN="/usr/bin/R"
RCMDSERVE=" CMD Rserve.dbg --save --RS-port 6336 --RS-enable-remote"
DAEMON="/usr/lib/R/bin/Rserve"
RSCRIPT="/usr/bin/Rscript"
RLIBS="/r/load-libs.r"
RLOGFILE=$LOGFILE


$RBIN $RCMDSERVE 
