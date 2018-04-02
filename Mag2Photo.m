function [ret]=Mag2Photo(mag,wl)
% 星等转换为电子计数
% mag: 星等
% wl: 波长, 量纲: 纳米
%
h=6.626176E-34; % 普朗克常数, [J.s]
c=3.0E8;        % 光速, [m/s]
watt=Mag2Watt(mag);
f = c / wl * 1E9; % 频率
[ret]=watt/h/f;
