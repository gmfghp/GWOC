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
	#read wan wifi oc time
	led_name=$(grep 'judge=' /etc/config/system | tail -n 1)
	var_judge=${led_name#*'judge='}
	judge=${var_judge%'wo'*}
	var_wo=${var_judge#*'wo'}
	wo=${var_wo%'wc'*}
	var_wc=${var_judge#*'wc'}
	wc=${var_wc%'wu'*}
	var_wu=${var_judge#*'wu'}
	wu=${var_wu%'wd'*}
	var_wd=${var_judge#*'wd'}
	wd=${var_wd%'end'*}

	#Judging whether to execute
	if [ "$judge"x == "1"x ]
	then
		#time effective
		var_time=$(date '+%H%M%S' | cut -b 1-5)
	elif [ "$judge"x == "0"x ]
	then
		#Invalid time
		var_time="hhmms"
		sleep 60
	elif [ "$judge"x == "2"x ]
	then
		#wan time
		var_time=2$(date '+%H%M%S' | cut -b 1-5)
	elif [ "$judge"x == "3"x ]
	then
		#wifi time
		var_time=3$(date '+%H%M%S' | cut -b 1-5)
	else
		var_time="hhmms"
		sleep 60
	fi

	sleep 2

#ifconfig
#uci set network.wan.disabled=0
#uci commit network
#/etc/init.d/network restart

	#wan off everyday
	if [ "$var_time"x == "$wc"x ] || [ "$var_time"x == "2$wc"x ]
	then
		#wan down
		uci set network.wan.disabled='1'
		uci commit network
		/etc/init.d/network restart

		sleep 5
	fi

	#wan on everyday
	if [ "$var_time"x == "$wo"x ] || [ "$var_time"x == "2$wo"x ]
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
	if [ "$var_time"x == "$wd"x ] || [ "$var_time"x == "3$wd"x ]
	then
		wifi down 
		sleep 5
	fi

	#wifi on everyday
	if [ "$var_time"x == "$wu"x ] || [ "$var_time"x == "3$wu"x ]
	then
		wifi up
		sleep 5
	fi

	sleep 3

done
