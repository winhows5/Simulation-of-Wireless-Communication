clc;
clear all;
%����BSC�ŵ�������
x=0:0.01:1;%BSC�ŵ���������
y=x;%�����ź�������
%���õ����źŵĲ������
xSampleTime=1/100000;
%���÷���ʱ�䳤��
xSimulationTime=10;
%��ʼ������
xInitialSeed=21;
%x��ʾBSC�ŵ����������
x1=[0.01,0.02,0.03,0.05,0.08,0.1,0.15,0.2,0.3,0.4,0.5,0.8];
for i=1:length(x1)
%���������ȡ������ֵ
BitErrorRate=x1(i);
%ִ�з���ģ��
sim('BSC_BER')
y1(i)=xErrorRate(1);
end
plot(x1,y1,'*',x,y)
xlabel('BSC�ŵ����������')
ylabel('�����źŵ��������')
title('BSC�ŵ�����')
legend('����','����')