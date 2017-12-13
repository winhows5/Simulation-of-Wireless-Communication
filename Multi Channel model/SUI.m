clc
clear all;
N=10000;%���������ʵ�ֵ���Ŀ
OR=20;%�۲�Ƶ�ʣ�Hz��
M=256;%�������˲����Ľ���
Dop_res=0.1;%SUI�����еĶ������о���Hz�������ظ����������У�
res_accu=20;%�ظ��������̵ľ�ȷ��
%%%%%SUI�ŵ�����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=[0 -5 -10];%ÿһ�׵Ĺ���˥��
K=[1 0 0];%K����
tau=[0.0 0.4 0.9];%ÿ����ͷ��ʱ��
Dop=[0.4 0.3 0.5];%��������Ƶ�Ʋ���
ant_corr=0.4;%���������
Fnorm=-1.5113;%�����һ������
%%%%%%%%%%%����m��ֵ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P = 10.^(P/10);%�������Թ���
s2 = P./(K+1); % ���㷽��
m2 = P.*(K./(K+1)); % ���㳣������
m = sqrt(m2); % ���㳣������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rmsdel = sqrt( sum(P.*(tau.^2))/sum(P) - (sum(P.*tau)/sum(P))^2 );
fprintf('rms delay spread %6.3f ��s\n', rmsdel);
%%%%%%%%%���ض������¼��������ŵ�ϵ��%%%%%%%%%%%%%%%%
L = length(P); % ����
paths_r = sqrt(1/2)*(randn(L,N) + j*randn(L,N)).*((sqrt(s2))' * ones(1,N)); %L*N����ÿ�׵���������
paths_c = m' * ones(1,N);%��������

for p = 1:L 
    D = Dop(p) / max(Dop) / 2; % ��һ����������Ƶ�� 
    f0 = [0:M*D]/(M*D); % Ƶ������ 
    PSD = 0.785*f0.^4 - 1.72*f0.^2 + 1.0; % PSD���� 
    filt = [ PSD(1:end-1) zeros(1,M-2*M*D) PSD(end:-1:2) ]; % S(f) 
    filt = sqrt(filt); %��S(f)��|H(f)| 
    filt = ifftshift(ifft(filt)); % ���������Ӧ 
    filt = real(filt); % Ѱ��ʵ���˲���
    filt = filt / sqrt(sum(filt.^2)); %��һ���˲���
    path = fftfilt(filt, [ paths_r(p,:) zeros(1,M) ]); 
    paths_r(p,:) = path(1+M/2:end-M/2); 
end; 
paths = paths_r + paths_c;%·���������
Pest = mean(abs(paths).^2, 2);
fprintf('tap mean power level: %0.2f dB\n', 10*log10(Pest));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SR = max(Dop)*2; % ��ȷ������
m = lcm(SR/Dop_res, OR/Dop_res); %����С������
P = m/SR*Dop_res; % ����
Q = m/OR*Dop_res; % ��ĸ 
paths_OR = zeros(L,ceil(N*P/Q)); % �����¾���
for p=1:L
    paths_OR(p,:) = resample(paths(p,:), P, Q, res_accu);
end;
Pest = mean(abs(paths_OR).^2, 2);
fprintf('tap mean power level: %0.2f dB\n', 10*log10(Pest));
paths_OR1=10*lg(paths_OR);
NN=length(paths_OR(1,:));
y1=abs(paths_OR).^2;
y2=10*log10(y1);%ת��ΪdB
t=60;%ʱ�䳤��
x=1:NN;
y=x/OR;
plot(y,y2(1,:),y,y2(2,:),'--',y,y2(3,:),'-.')
axis([1,60,-60,10])
legend('tab1','tab2','tab3')
xlabel('ʱ�䣨s���۲�Ƶ��20Hz')
ylabel('ÿһ�׵ķ���dB')


