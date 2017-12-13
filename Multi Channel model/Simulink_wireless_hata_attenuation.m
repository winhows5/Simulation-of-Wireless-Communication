clc;
clear all
%f=900;
%d=0.1:0.1:100;
%y=wireless_free_space_attenuation(d,f);
d=1:0.1:100;
y=wireless_hata_attenuation(1,900,1.5,50,d);
y1=wireless_hata_attenuation(3,900,1.5,50,d);
y2=wireless_hata_attenuation(4,900,1.5,100,d);
y3=wireless_hata_attenuation(5,900,1.5,100,d);
plot(d,y,'-r',d,y1,d,y2,'-.',d,y3,'--c');
xlabel('����(km)');
ylabel('��ģ�dB)');
title('Okumura-Hataģ�����');
legend('��С����f=900MHz,Hm=1.5m,Hb=50m','�����f=900MHz,Hm=1.5m,Hb=50m','����f=900MHz,Hm=1.5m,Hb=100m','ũ��f=900MHz,Hm=1.5m,Hb=100m')
