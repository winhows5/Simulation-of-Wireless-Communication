clc;
clear all;
%理论BSC信道误码率
x=0:0.01:1;%BSC信道的误码率
y=x;%接收信号误码率
%设置调制信号的采样间隔
xSampleTime=1/100000;
%设置仿真时间长度
xSimulationTime=10;
%初始化种子
xInitialSeed=21;
%x表示BSC信道的误比特率
x1=[0.01,0.02,0.03,0.05,0.08,0.1,0.15,0.2,0.3,0.4,0.5,0.8];
for i=1:length(x1)
%信噪比依次取向量的值
BitErrorRate=x1(i);
%执行仿真模型
sim('BSC_BER')
y1(i)=xErrorRate(1);
end
plot(x1,y1,'*',x,y)
xlabel('BSC信道的误比特率')
ylabel('接收信号的误比特率')
title('BSC信道仿真')
legend('仿真','理论')