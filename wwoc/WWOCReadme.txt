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
2019-04-03��ӳ�����
2019-07-03plus���WEB���޸�wwoc����

SSH��ִ������

��ȡ״̬����


echo $(grep 'judge=' /etc/config/system | tail -n 1)

�޸�״̬����Ϊ����״̬��


ֱ���� ϵͳ -- LED ���� ��ֱ�����һ��LED���ù���������

judge=0wo03100wc03000wu03150wd03050end

��������״̬��ѡ

judge=0��1��2��3

0��wan��wifi����ȫ��ȡ��
1��wan��wifi����ȫ������
2��wan���У�wifiȡ��
3��wanȡ����wifi����

��������������������������������������������������������������������
��������������������������������������������������������������������

����WWOC.sh����

ps | grep WWOC.sh | grep -v grep

kill ���̺�

sh /root/wwoc/WWOC.sh



