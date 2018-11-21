function [av]=rotspd(h)
%
% h: ����߶�, [2?]
% ������������ʽ, ���㲻ͬ����Ĺ�ת���ٶ�
%
G = 6.67408E-11;   % ������������
M = 5.977E24;    % ��������, [?]
R0 = 6.378E6;    % ����뾶, [m]

R=R0+h*1000;
Beta=0:0.01*pi:0.5*pi;
Deg=Beta*180/pi;
W0=sqrt(G*M/power(R,3.0))*206265;
w0=sqrt(G*M/power(R0+35796*1000,3.0))*206265;
% W=W0-w0;
W=W0;

RH=sqrt(R*R - R0*R0*cos(Beta).^2) - R0*sin(Beta);
Theta=acos((RH.^2 + R^2 - R0^2)/(2*RH*R));
WA= W*R*cos(Theta)./RH;
av=WA;
%x=WA(1)
%y=WA(20)

% plot(Deg,WA,'b+');
W0=7*206265/(h-1000);
t=300/W0;
