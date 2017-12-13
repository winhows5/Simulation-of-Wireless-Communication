%%%%%%%%%%%%%%%COST231-WI非视距传播模型%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%适用条件f=800-2000MHz;Hb=4-50m;Hm=1-3m;d=0.02-5km%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%发射功率f(MHz),收发天线距离(小区半径)d(km)%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%移动台高度Hm(m),基站高度Hb(m)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%建筑物屋顶高度Hroof(m),道路宽度w(m),建筑物间隔b(m)%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%相对直接无线路径的道路方向性Phi(度)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%Model=1;中等规模城市和植被覆盖密度适中的郊区中心%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Model=2;大城市的中心%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y=wireless_Walfish_Ikegami_NLOS_attenuation(Model,f,d,Hm,Hb,Hroof,w,b,Phi)
L0=32.4+20*log(d)/log(10)+20*log(f)/log(10);%自由空间的损耗
if (Phi>=0)&Phi<35
    Lcri=-10+0.354*Phi;
elseif Phi>=35&Phi<55
    Lcri=2.5+0.075*(Phi-35);
elseif Phi>=55&Phi<=90
    Lcri=4.0+0.114*(Phi-55);
end
Lrts=-16.9-10*log(w)/log(10)+10*log(f)/log(10)+20*log(Hb-Hm)/log(10)+Lcri%从屋顶到街道的绕射和散射损耗
if Hb>Hroof
    Lbsh=-18*log(1+Hb-Hroof)/log(10);
    ka=54;
    kd=18;
elseif d>=0.5
    Lbsh=0;
    ka=54-0.8*(Hb-Hroof);
    kd=18-15*(Hb-Hroof)/Hroof;
else
    Lbsh=0;
    ka=54-0.8*(Hb-Hroof)*(d/0.5);
    kd=18-15*(Hb-Hroof)/Hroof;
end
if Model==1
    kf=-4+0.7*(f/925-1);
elseif Model==2
    kf=-4+1.5*(f/925-1);
end
Lmsd=Lbsh+ka+kf*log(f)/log(10)+kd*log(d)/log(10)-9.1*log(b)/log(10);%多屏绕射损耗
if Lrts+Lmsd<=0
    y=L0;
else
y=L0+Lrts+Lmsd;
end
 