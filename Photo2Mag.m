function [ret]=Photo2Mag(p,wl)
% 由光子数计算对应的星等
% p : 光子数
% wl: 波长, 量纲: nm
%
h=6.626176E-34;     % 普朗克常数
c=3.0E8;            % 光速
f=c/wl*1E9;         % 频率
watt=p*h*f;         % 功率
ret=Watt2Mag(watt);
