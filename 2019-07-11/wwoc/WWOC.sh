#!/bin/sh

#Boot up to set wan enable
sleep 10
uci set network.wan.disabled='0'
uci commit network
/etc/init.d/network restart
sleep 10

while :
do

	#read wan wifi oc time && read now time in system
	led_name=$(grep 'wwoc=' /etc/config/system | tail -n 1)
	wwoc=${led_name#*'wwoc='}
	wo=${wwoc:2:5}
	wc=${wwoc:9:5}
	wu=${wwoc:16:5}
	wd=${wwoc:23:5}
	nowtime=$(date '+%H%M%S' | cut -b 1-5)
	led_name1=$(grep 'wwoc1=' /etc/config/system | tail -n 1)
	wwoc1=${led_name1#*'wwoc1='}
	wo1=${wwoc1:2:5}
	wc1=${wwoc1:9:5}
	wu1=${wwoc1:16:5}
	wd1=${wwoc1:23:5}

	#Judging whether to execute
	if [ "$wo"x == "close"x ] || [ "$wo"x == x ]
	then
		sleep 100
	else
		sleep 3
	fi

#ifconfig

	#wan off everyday
	if [ "$nowtime"x == "$wc"x ] || [ "$nowtime"x == "$wc1"x ]
	then
		#wan off
		uci set network.wan.disabled='1'
		uci commit network
		/etc/init.d/network restart
		sleep 5
	fi

	#wan on everyday
	if [ "$nowtime"x == "$wo"x ] || [ "$nowtime"x == "$wo1"x ]
	then
		#wan on
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

	#wifi down everyday
	if [ "$nowtime"x == "$wd"x ] || [ "$nowtime"x == "$wd1"x ]
	then
		wifi down 
		sleep 5
	fi

	#wifi up everyday
	if [ "$nowtime"x == "$wu"x ] || [ "$nowtime"x == "$wu1"x ]
	then
		wifi up
		sleep 5
	fi

done
