function [ret] = MaxSL(d,t,n,wl,q,q0)
% 计算在限定条件下可容许的最大杂散光辐射照度和PST
% d    : 光学系统口径, 量纲: 米
% n    : 构成目标的像素数
% wl   : 波长, 量纲: 纳米
% q    : 系统效率
% q0   : 量子效率
% mag0 : 探测极限，即计算探测能力为该值时允许的
%
RD = 15;       % 读出噪声, [e-/pixel]
D = 1;         % 暗电流, [e-/pixel/s]
B0 = 8.9E-7;   % 黄道光辐射强度, [W/m^2/Sr/s @500nm]
pixed= [9E-6 9E-6 12E-6 12E-6]; % 像元边长, [m]
pixa = pixed.*pixed;            % 像元面积, [m^2]
pixs = [9.28 4.64 12.37 6.19];  % 像元张角, [″/pixel]
pixs2= pixs.*pixs;
sr = Arcsec2Sr(pixs2);
r0 = 5;           % 信噪比阈值
r2 = r0 * r0;
A = pi * d * d / 4;     % 聚光面积, [m^2]
pst0 = [-7 -8 -9];      % 典型PST值
SL0=Mag2Photo(-26.7,wl)*t;     % 太阳视星等-26.7, 转换为光子数=杂散光0倾角辐照度

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
title(['\fontsize{20}\bf', int2str(n), 'x', int2str(n), ', 不同PST的探测能力']);
