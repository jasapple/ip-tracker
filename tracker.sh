#! /bin/bash

exec >> /data/ip-tracker/ip-tracker.log 2>&1

Main (){
	if [[ -z $1 ]]; then
		echo "no DNS entry provided. Aborting"
		exit 1
	fi
	now=$(date -u +"%Y-%m-%dT%H:%M:%S%:z")
	ip=$(/usr/bin/dig "$1" +short)
	#/bin/echo $ip
	whoami=$(/usr/bin/dig +short txt ch whoami.cloudflare @1.0.0.1 | tr -d '"')
	echo "$now \"$1\" > $ip vs $whoami" 
}
#/bin/echo "tracking IP for {$1}"
Main $1
