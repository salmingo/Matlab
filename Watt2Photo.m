function [ret]=Watt2Photo(watt, wl)
% �����ն�ת�������Ӽ���
% watt: �����ն�, ����: [W]
% wl  : ����, ����: [nm]
h=6.626176E-34; % ���ʿ˳���, [J.s]
c=3.0E8;        % ����, [m/s]
f=c/wl*1E9;     % Ƶ��
ret=watt/h/f;
