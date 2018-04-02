function [ret]=Mag2Watt(mag)
% 将星等转换为[W/m^-2]
ret=1.78E-8 * power(10., -0.4 * mag);
