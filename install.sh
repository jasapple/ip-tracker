#! /bin/bash


Main (){
	if [ ! -d /var/log/ip-tracker ]; then
		mkdir /var/log/ip-tracker
	fi

	if [ ! -d /opt/ip-tracker ]; then
		mkdir /opt/ip-tracker
	fi

	if [ -z $1 ]; then
		/usr/bin/echo "no target URL provided, exiting"
		exit(1)

	fi
	cp ip-tracker.sh /opt/ip-tracker.sh
	cp ip-tracker.cron /etc/cron.d/ip-tracker
	cp ip-tracker.logrotate /etc/logrotate.d/ip-tracker

	/usr/bin/chmod +x /opt/ip-tracker.sh
	/usr/bin/sed -i -e "s/remote.example.com/${URL}/g" /etc/cron.d/ip-tracker
}
Main $1
