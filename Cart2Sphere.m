function [r,alpha,beta]=Cart2Sphere(x, y, z)
% Decare coordinates to Sherical coordinates
r=sqrt(x.*x+y.*y+z.*z);
alpha=atan2(y,x);
beta=atan2(z,sqrt(x.*x+y.*y));
