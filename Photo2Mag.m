function [ret]=Photo2Mag(p,wl)
% �ɹ����������Ӧ���ǵ�
% p : ������
% wl: ����, ����: nm
%
h=6.626176E-34;     % ���ʿ˳���
c=3.0E8;            % ����
f=c/wl*1E9;         % Ƶ��
watt=p*h*f;         % ����
ret=Watt2Mag(watt);
