function [ret] = MaxSL(d,t,n,wl,q,q0)
% �������޶������¿�����������ɢ������նȺ�PST
% d    : ��ѧϵͳ�ھ�, ����: ��
% n    : ����Ŀ���������
% wl   : ����, ����: ����
% q    : ϵͳЧ��
% q0   : ����Ч��
% mag0 : ̽�⼫�ޣ�������̽������Ϊ��ֵʱ�����
%
RD = 15;       % ��������, [e-/pixel]
D = 1;         % ������, [e-/pixel/s]
B0 = 8.9E-7;   % �Ƶ������ǿ��, [W/m^2/Sr/s @500nm]
pixed= [9E-6 9E-6 12E-6 12E-6]; % ��Ԫ�߳�, [m]
pixa = pixed.*pixed;            % ��Ԫ���, [m^2]
pixs = [9.28 4.64 12.37 6.19];  % ��Ԫ�Ž�, [��/pixel]
pixs2= pixs.*pixs;
sr = Arcsec2Sr(pixs2);
r0 = 5;           % �������ֵ
r2 = r0 * r0;
A = pi * d * d / 4;     % �۹����, [m^2]
pst0 = [-7 -8 -9];      % ����PSTֵ
SL0=Mag2Photo(-26.7,wl)*t;     % ̫�����ǵ�-26.7, ת��Ϊ������=��ɢ��0��Ƿ��ն�

b = Watt2Photo(B0*t*A*sr, wl)*q*n+D*t*n+RD*RD*n;
p=(r2+sqrt(power(r0,4)+4*r2*b))*0.5/q/A/t;
magmax=Photo2Mag(p,wl);
N1=length(magmax);
N2=length(pst0);

figure;
hold on;

for i=1:N1
%    mag=13:0.1:14;
%    mag=14.5:0.1:15.5;
%    mag=15.5:0.01:magmax(i);
    mag=12:0.01:magmax(i);
    p=Mag2Photo(mag,wl)*t*A*q;
    SL1=(p.*(p/r2-1) - b(i))/n/pixa(i)/q0;
    pst=SL1/SL0;
    logpst=log10(pst);
    plot(mag,logpst);
    
    SL2=SL0*power(10,pst0)*pixa(i)*q0;
    p=(r2+sqrt(r2*r2+4*r2*(n*SL2+b(i))))*0.5/q/A/t;
    mag=Photo2Mag(p,wl);
    plot(mag,pst0,'*');
    
    y=-9-0.4*(i-1);
    for j=1:N2
        x=12.5+(j-1);
        text(x,y,['\fontsize{14}<pixs= ',num2str(pixs(i)), ', pst= 10^', num2str(pst0(j)), '> = ', num2str(mag(j))]);
    end
end

grid on;
xlabel('\fontsize{14}\bfMag');
ylabel('\fontsize{14}\bfLog10(PST)');

n=sqrt(n);
title(['\fontsize{20}\bf', int2str(n), 'x', int2str(n), ', ��ͬPST��̽������']);
