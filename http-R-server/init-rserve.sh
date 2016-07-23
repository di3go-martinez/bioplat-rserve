##############################################
## Service for RServe  
## 12/09/2015: Testing only ubuntu
##############################################
#!/bin/sh

. /lib/lsb/init-functions

## Variables
LOGFILE="/var/log/rserve.log"
##CONFIGFILE="/etc/Rserv.conf"


# Rserve configs
RBIN="/usr/bin/R"
RCMDSERVE=" CMD Rserve --save --RS-port 6336 --RS-enable-remote"
DAEMON="/usr/lib/R/bin/Rserve"
RSCRIPT="/usr/bin/Rscript"
RLIBS="/r/load-libs.r"
RLOGFILE="/var/log/rserve.log"


#test -f $CONFIGFILE || exit 0
#test -x $DAEMON || exit 0

stop_rserve()
{
    # Stop the Rserve daemon
    start-stop-daemon --stop --quiet --oknodo --exec $DAEMON    	
}

start_rserve()
{
    # Start the Rsere daemon with the R CMD
    start-stop-daemon --start --quiet --oknodo --exec $RBIN -- $RCMDSERVE
    $RSCRIPT $RLIBS
}


case "$1" in
  start)
        log_daemon_msg "Starting rserve"
        if start_rserve ; then
            log_end_msg 0
        else
            log_end_msg 1
        fi
        ;;
    stop)
        log_daemon_msg "Stopping rserve"
        if stop_rserve; then
            log_end_msg 0
        else
            log_end_msg 1
        fi
        ;;
  restart)
    log_daemon_msg "Stopping rserve for restart"
    stop_rserve
    log_end_msg 0
    sleep 2
    log_daemon_msg "Restarting rserve"
    start_rserve
    log_end_msg 0
    ;;
  status)
    status
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
    ;;
esac

exit 0
