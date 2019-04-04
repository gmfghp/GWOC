#!/bin/sh

#set 0judge.log
echo "judge=0" >> /root/0judge.log

#set init script
cp /root/GPowerboot /etc/init.d/GPowerboot
chmod +x /etc/init.d/GPowerboot
/etc/init.d/GPowerboot enable
sleep 5
(/etc/init.d/GPowerboot start &)
