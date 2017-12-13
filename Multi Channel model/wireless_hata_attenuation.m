%%%%%%%%%%%%%%%hata����ģ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%��������f=150-1000MHz;Hb=30-100m;Hm=1-10m;d=1-20km%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%wireless_hata_attenuation(Model,f,Hm,Hb,d)%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%���书��f(MHz),�շ����߾���(С���뾶)d(km)%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%�ƶ�̨�߶�Hm(m),��վ�߶�Hb(m)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Model=1;��С����.Model=2;�����f<=200MHz.Model=3;�����f>=400MHz.%%%%%%%%%%
%%%%Model=4;����.Model=5;ũ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y=wireless_hata_attenuation(Model,f,Hm,Hb,d)
y1=69.55+26.16*log(f)/log(10)-13.82*log(Hb)/log(10)+(44.9-6.55*log(Hb)/log(10))*log(d)/log(10);
if Model==1
    a=(1.11*log(f)/log(10)-0.7)*Hm-(1.56*log(f)/log(10)-0.8);
elseif Model==2
    a=8.29*(log(1.54*Hm)/log(10)).^2-1.1;
elseif Model==3
    a=3.2*(log(11.75*Hm)/log(10)).^2-4.97;
elseif Model==4
    a=(log(f/28)/log(10)).^2+5.4;
elseif Model==5
    a=40.98+4.78*(log(f)/log(10)).^2-18.33*log(f)/log(10);
else
    error('no that model');
end
y=y1-a;
    