文件名:
WWOC
WWOC.sh
WWOCScript.sh

将文件全部拷贝到/root/wwoc/目录
运行 WWOCScript.sh
命令 sh /root/wwoc/WWOCScript.sh

WINSCP登陆后可直接在/root/wwoc目录修改下面文件
WWOC.sh
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


··································
··································

2019-07-11调整WEB下修改wwoc参数

SSH下执行命令

读取状态命令


echo $(grep 'wwoc=' /etc/config/system | tail -n 1)
echo $(grep 'wwoc1=' /etc/config/system | tail -n 1)

修改状态

直接在 系统 -- LED 配置 下直接添加一个LED配置共享名如下

wwoc=woclosewchhmmswuhhmmswdhhmms

其中woclose的close为判断是否不需要执行以睡眠100s（或者为空，也睡眠100s）

如果不需要执行的动作 即用hhmms替换掉时间数就可以。


加入多时间点最多两个时间点（wwoc1=）如下

wwoc1=woclosewchhmmswuhhmmswdhhmms

··································
··································

重启WWOC.sh命令

ps | grep WWOC.sh | grep -v grep

kill 进程号

sh /root/wwoc/WWOC.sh



