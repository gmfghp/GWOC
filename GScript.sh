#!/bin/sh

#set init script
cp /root/GPowerboot /etc/init.d/GPowerboot
chmod +x /etc/init.d/GPowerboot
/etc/init.d/GPowerboot enable
sleep 5
(/etc/init.d/GPowerboot start &)
