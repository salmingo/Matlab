function [ret]=RevolutionSpeed0(h)
% ������������������, ����ģ�����Ƶ�(����)����Ĺ�ת�ٶ�
% h: �������߶�, ����: km
% ret(1): ���ٶ�, ����: arc/sec
% ret(2): ���ٶ�, ����: m/sec
% 
M = 5.977E24;    % ��������, [?]
R0 = 6.378E6;    % ����뾶, [m]
r=R0+h*1000;
ret=RevolutionSpeed(M,r);
