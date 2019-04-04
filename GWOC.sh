#!/bin/sh

#Boot up to set wan enable
sleep 10
uci set network.wan.disabled='0'
uci commit network
/etc/init.d/network restart
sleep 10

while :
do

	#Judging whether to run or not & read now time in system
	#if [ "$(date '+%T' | cut -b 1-7)" == "00:00:0" ]

	var_0judge=$(grep 'judge=' /root/0judge.log | tail -n 1)
	var_judge=${var_0judge:6:1}

	#Judging whether to execute
	if [ "$var_judge"x == "1"x ]
	then
		#time effective
		var_time=$(date '+%T' | cut -b 1-7)
	elif [ "$var_judge"x == "0"x ]
	then
		#Invalid time
		var_time="xx:xx:x"
	elif [ "$var_judge"x == "2"x ]
	then
		#wan time
		var_time=2$(date '+%T' | cut -b 1-7)
	elif [ "$var_judge"x == "3"x ]
	then
		#wifi time
		var_time=3$(date '+%T' | cut -b 1-7)
	else
		echo "judge=0" >> /root/0judge.log
	fi

	sleep 2

#ifconfig
#uci set network.wan.disabled=0
#uci commit network
#/etc/init.d/network restart

	#wan off everyday
	if [ "$var_time"x == "07:55:0"x ] || [ "$var_time"x == "207:55:0"x ]
	then
		#wan down
		uci set network.wan.disabled='1'
		uci commit network
		/etc/init.d/network restart
		cat /dev/null > /root/0judge.log
		echo "$var_0judge" >> /root/0judge.log

		sleep 5
	fi

	#wan on everyday
	if [ "$var_time"x == "17:35:0"x ] || [ "$var_time"x == "217:35:0"x ]
	then
		#wan up
		uci set network.wan.disabled='0'
		uci commit network
		/etc/init.d/network restart
		cat /dev/null > /root/0judge.log
		echo "$var_0judge" >> /root/0judge.log

		sleep 5
	fi

#wifi status
#uci set wireless.@wifi-iface[1].disabled=0
#uci set wireless.@wifi-iface[2].disabled=0
#uci commit wireless
#wifi

	#wifi off everyday
	if [ "$var_time"x == "23:30:0"x ] || [ "$var_time"x == "323:30:0"x ]
	then
		#uci set wireless.@wifi-iface[1].disabled=1
		#uci commit wireless
		#wifi
		wifi down
		cat /dev/null > /root/0judge.log
		echo "$var_0judge" >> /root/0judge.log
		sleep 5
	fi

	#wifi on everyday
	if [ "$var_time"x == "05:30:0"x ] ||  [ "$var_time"x == "305:30:0"x ]
	then
		#uci set wireless.@wifi-iface[1].disabled=0
		#uci commit wireless
		#wifi
		wifi up
		cat /dev/null > /root/0judge.log
		echo "$var_0judge" >> /root/0judge.log
		sleep 5
	fi

	sleep 3

done
