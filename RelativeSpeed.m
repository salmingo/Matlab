function RelativeSpeed()
% 计算不同轨道高度的相对角速度
%
r=5000:1000:36000;
r1=5000:5000:35000;
RtoS=180*3600/pi;
h0=1000;
spd0=RevolutionSpeed0(h0);
av=spd0(2)*RtoS./(r-h0)/1000;
av1=spd0(2)*RtoS./(r1-h0)/1000;
t=9.4./av1;
mag1=-2.5*log10(t)
mag2=-2.5*log10(sqrt(t))
plot(r1,av1,'r*',r,av);
grid on;
xlabel('\fontsize{14}h [km]');
ylabel('\fontsize{14}angular velocity [arcsec/sec]');
title('\fontsize{18}Relative Angular Velocity');
