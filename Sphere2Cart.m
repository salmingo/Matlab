function [x,y,z]=Sphere2Cart(r, alpha, beta)
% Spherical coordinates to decare coordinates
x = r*cos(beta).*cos(alpha);
y = r*cos(beta).*sin(alpha);
z = r*sin(beta);
