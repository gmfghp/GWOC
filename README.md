# GWOC
OP wan wifi 按时关启

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

2019-04-03添加常单控

································································································

SSH下执行命令

读取状态命令

echo "$(grep 'judge=' /root/0judge.log | tail -n 1)"

修改状态命令（分为四种状态）

echo "judge=0" >> /root/0judge.log

其中四钟状态可选

judge=0，1，2，3

0：wan，wifi操作全部取消

1：wan，wifi操作全部进行

2：wan进行，wifi取消

3：wan取消，wifi进行

或者 按reset按钮（暂只含有状态1,2）
