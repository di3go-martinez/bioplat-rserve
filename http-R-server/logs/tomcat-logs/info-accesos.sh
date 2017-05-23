#!/bin/bash

file=$1

if [ "x" == "x$1"  ]; then
  file="$(ls -tr1 localhost* | tail -n1)"
fi

cat $file |  sort | while read line; do 

	#FIXME mal si la ip contiene *40*
	if [[ $line != *"40"*  ]]; then

		ip=$(echo $line| cut -f1 -d- ); 
		if [  "$latestip" !=  "$ip" ];then   
			curl -s ipinfo.io/$ip #| grep -Po '"loc":.*?[^\\]",';   
			latestip=$ip; 
		fi; 
	fi;
done
