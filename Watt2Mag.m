function [ret]=Watt2Mag(watt)
% �����ն�ת��Ϊ�ǵ�
% watt: ����[W/m^2]
%
ret=-2.5*log10(1E8*watt/1.78);
