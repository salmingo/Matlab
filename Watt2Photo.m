function [ret]=Watt2Photo(watt, wl)
% 辐射照度转换到光子计数
% watt: 辐射照度, 量纲: [W]
% wl  : 波长, 量纲: [nm]
h=6.626176E-34; % 普朗克常数, [J.s]
c=3.0E8;        % 光速, [m/s]
f=c/wl*1E9;     % 频率
ret=watt/h/f;
