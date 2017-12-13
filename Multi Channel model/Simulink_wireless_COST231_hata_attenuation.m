clc;
clear all;
d=1:0.1:20;
y=wireless_COST231_hata_attenuation(1,1800,1.5,40,d);
y1=wireless_COST231_hata_attenuation(3,1800,1.5,40,d);
y2=wireless_COST231_hata_attenuation(4,1800,1.5,100,d);
y3=wireless_COST231_hata_attenuation(5,1800,1.5,100,d);
plot(d,y,'-r',d,y1,d,y2,'-.',d,y3,'--c');
xlabel('距离(km)');
ylabel('损耗（dB)');
title('COST231-Hata模型损耗');
legend('中小城市f=1800MHz,Hm=1.5m,Hb=40m','大城市f=1800MHz,Hm=1.5m,Hb=40m','郊区f=1800MHz,Hm=1.5m,Hb=100m','农村f=1800MHz,Hm=1.5m,Hb=100m')