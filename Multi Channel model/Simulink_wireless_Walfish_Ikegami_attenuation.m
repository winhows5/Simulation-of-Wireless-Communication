clc;
clear all;
f=900;
d=0.02:0.01:5;
y=wireless_Walfish_Ikegami_LOS_attenuation(900,d);
d1=0.02:0.01:5;
Model=1;
Hm=1.5;
Hb=17;
w=20;
b=40;
Phi=90;
Hroof=15;
f1=900;
f2=1800;
y1=wireless_Walfish_Ikegami_NLOS_attenuation(Model,f1,d1,Hm,Hb,Hroof,w,b,Phi);
y2=wireless_Walfish_Ikegami_NLOS_attenuation(Model,f2,d1,Hm,Hb,Hroof,w,b,Phi);
plot(d,y,'-.c',d1,y1,'--r',d1,y2,'--k');
xlabel('����(km)')
ylabel('·�����(dB)')
title('COST231-WIģ��·�����')
legend('�Ӿ�·�����f=900MHz','���Ӿ�·�����f=900MHz','���Ӿ�·�����f=1800MHz')