clc;
clear all;
%设置调制信号的采样间隔
xSampleTime=1/100000;
%设置仿真时间长度
xSimulationTime=5;
%初始化种子
xInitialSeed=21;
%x表示信噪比的取值范围
x=0:0.5:10;
y1=x;
for i=1:length(x)
%信噪比依次取向量的值
xSNR=x(i);
%执行仿真模型
sim('BPSK_BER1')
y1(i)=xErrorRate(1);
end
SNRindB2=0:0.1:10;
for i=1:length(SNRindB2)
    SNR=exp(SNRindB2(i)*log(10)/10);
    the(i)=Qfunct(sqrt(2*SNR));
end
semilogy(x,y1,'*',SNRindB2,the)
legend('仿真误码率','理论误码率')
xlabel('信噪比（dB)')
ylabel('误码率')
title('高斯白噪声信道下BPSK误码率仿真')