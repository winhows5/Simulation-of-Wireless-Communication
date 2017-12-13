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
xlabel('距离(km)');
ylabel('损耗（dB)');
title('Okumura-Hata模型损耗');
legend('中小城市f=900MHz,Hm=1.5m,Hb=50m','大城市f=900MHz,Hm=1.5m,Hb=50m','郊区f=900MHz,Hm=1.5m,Hb=100m','农村f=900MHz,Hm=1.5m,Hb=100m')
