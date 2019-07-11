#!/bin/sh

#set init script
cp /root/wwoc/WWOC /etc/init.d/WWOC
chmod +x /etc/init.d/WWOC
/etc/init.d/WWOC enable
sleep 5
(/etc/init.d/WWOC start &)

sleep 1
echo "WWOC OK"
