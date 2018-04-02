function [ret]=Watt2Mag(watt)
% 辐射照度转换为星等
% watt: 量纲[W/m^2]
%
ret=-2.5*log10(1E8*watt/1.78);
