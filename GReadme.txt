文件名:
GPowerboot
GWOC.sh
GScript.sh

将文件全部拷贝到/root/目录
运行 GScript.sh
命令 sh GScript.sh

WINSCP登陆后可直接在/root/目录修改下面文件
GWOC.sh
重启生效

SSH登陆运行以下命令可恢复状态
定时关启WAN
uci set network.wan.disabled=1

uci commit network
/etc/init.d/network restart

uci set network.wan.disabled=0
uci commit network
/etc/init.d/network restart
定时关启WIFI
wifi up

wifi down
或者
uci set wireless.@wifi-iface[1].disabled=0
uci set wireless.@wifi-iface[2].disabled=0
uci commit wireless
wifi
