clc;
clear all;
%���õ����źŵĲ������
xSampleTime=1/100000;
%���÷���ʱ�䳤��
xSimulationTime=5;
%��ʼ������
xInitialSeed=21;
%x��ʾ����ȵ�ȡֵ��Χ
x=0:0.5:10;
y1=x;
for i=1:length(x)
%���������ȡ������ֵ
xSNR=x(i);
%ִ�з���ģ��
sim('BPSK_BER1')
y1(i)=xErrorRate(1);
end
SNRindB2=0:0.1:10;
for i=1:length(SNRindB2)
    SNR=exp(SNRindB2(i)*log(10)/10);
    the(i)=Qfunct(sqrt(2*SNR));
end
semilogy(x,y1,'*',SNRindB2,the)
legend('����������','����������')
xlabel('����ȣ�dB)')
ylabel('������')
title('��˹�������ŵ���BPSK�����ʷ���')