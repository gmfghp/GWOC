�ļ���:
WWOC
WWOC.sh
WWOCScript.sh

���ļ�ȫ��������/root/wwoc/Ŀ¼
���� WWOCScript.sh
���� sh /root/wwoc/WWOCScript.sh

WINSCP��½���ֱ����/root/wwocĿ¼�޸������ļ�
WWOC.sh
������Ч

SSH��½������������ɻָ�״̬
��ʱ����WAN
uci set network.wan.disabled=1

uci commit network
/etc/init.d/network restart

uci set network.wan.disabled=0
uci commit network
/etc/init.d/network restart
��ʱ����WIFI
wifi up

wifi down
����
uci set wireless.@wifi-iface[1].disabled=0
uci set wireless.@wifi-iface[2].disabled=0
uci commit wireless
wifi


��������������������������������������������������������������������
��������������������������������������������������������������������

2019-07-11����WEB���޸�wwoc����

SSH��ִ������

��ȡ״̬����


echo $(grep 'wwoc=' /etc/config/system | tail -n 1)
echo $(grep 'wwoc1=' /etc/config/system | tail -n 1)

�޸�״̬

ֱ���� ϵͳ -- LED ���� ��ֱ�����һ��LED���ù���������

wwoc=woclosewchhmmswuhhmmswdhhmms

����woclose��closeΪ�ж��Ƿ���Ҫִ����˯��100s������Ϊ�գ�Ҳ˯��100s��

�������Ҫִ�еĶ��� ����hhmms�滻��ʱ�����Ϳ��ԡ�


�����ʱ����������ʱ��㣨wwoc1=������

wwoc1=woclosewchhmmswuhhmmswdhhmms

��������������������������������������������������������������������
��������������������������������������������������������������������

����WWOC.sh����

ps | grep WWOC.sh | grep -v grep

kill ���̺�

sh /root/wwoc/WWOC.sh



