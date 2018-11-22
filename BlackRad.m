function [mag, photo] = BlackRad(T, d, R)
% 计算温度T黑体辐射的视亮度
% T: 温度, 量纲: K
% r: 距离, 量纲: km
% d: 物体直径, 量纲: m
%
stefan_boltzmann = 5.670367E-8; % Stefan-Boltzmann常数, 量纲: W?m?2?K?4
R = R * 1000;
wl= 2.898E6/T;
watt=stefan_boltzmann*T^4*(d/R)^2/pi/4; % W?m?2
mag=Watt2Mag(watt);
photo=Watt2Photo(watt, wl)
end
