#/bin/bash


R CMD Rserve --save 2>&1 > /tmp/logs/r.log &

wait $!

pid_rserve=$(pidof Rserve)

#Rserve corre en modo demonio, con docker tiene que correr en foreground
while ps -ef | grep $pid_rserve 1>/dev/null; do
	sleep 1m
done


