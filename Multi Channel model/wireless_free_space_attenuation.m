%%%%%%%%%%���ɿռ䴫�����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%wireless_free_space_attenuation(d,f)��λ(DB)%%%%%
%%%%%%%%%%�շ�����֮��ľ���d(km),����Ƶ��f(Mhz)%%%%%%%%%%%%
function y=wireless_free_space_attenuation(d,f)
y=32.4+20*log(d)/log(10)+20*log(f)/log(10);