function [ret]=Mag2Watt(mag)
% ���ǵ�ת��Ϊ[W/m^-2]
ret=1.78E-8 * power(10., -0.4 * mag);
