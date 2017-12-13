%%%%%%%%%%自由空间传播损耗%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%wireless_free_space_attenuation(d,f)单位(DB)%%%%%
%%%%%%%%%%收发天线之间的距离d(km),发射频率f(Mhz)%%%%%%%%%%%%
function y=wireless_free_space_attenuation(d,f)
y=32.4+20*log(d)/log(10)+20*log(f)/log(10);