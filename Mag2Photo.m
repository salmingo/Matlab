function [ret]=Mag2Photo(mag,wl)
% �ǵ�ת��Ϊ���Ӽ���
% mag: �ǵ�
% wl: ����, ����: ����
%
h=6.626176E-34; % ���ʿ˳���, [J.s]
c=3.0E8;        % ����, [m/s]
watt=Mag2Watt(mag);
f = c / wl * 1E9; % Ƶ��
[ret]=watt/h/f;
