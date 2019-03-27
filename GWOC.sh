#!/bin/sh

while :
do

	#read now time in system
	#if [ "$(date '+%T' | cut -b 1-7)" == "00:00:0" ]
	var_time=$(date '+%T' | cut -b 1-7)

#ifconfig
#uci set network.wan.disabled=0
#uci commit network
#/etc/init.d/network restart

	#wan off everyday
	if [ "$var_time"x == "07:55:0"x ]
	then
		#wan down
		uci set network.wan.disabled='1'
		uci commit network
		/etc/init.d/network restart

		sleep 5
	fi

	#wan on everyday
	if [ "$var_time"x == "17:35:0"x ]
	then
		#wan up
		uci set network.wan.disabled='0'
		uci commit network
		/etc/init.d/network restart

		sleep 5
	fi

#wifi status
#uci set wireless.@wifi-iface[1].disabled=0
#uci set wireless.@wifi-iface[2].disabled=0
#uci commit wireless
#wifi

	#wifi off everyday
	if [ "$var_time"x == "23:30:0"x ]
	then
		#uci set wireless.@wifi-iface[1].disabled=1
		#uci commit wireless
		#wifi
		wifi down
		sleep 5                                                                                                                     
	fi

	#wifi on everyday
	if [ "$var_time"x == "05:30:0"x ]
	then
		#uci set wireless.@wifi-iface[1].disabled=0
		#uci commit wireless
		#wifi
		wifi up
		sleep 5
	fi

	sleep 5

done
