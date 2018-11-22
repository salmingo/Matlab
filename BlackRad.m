function [mag, photo] = BlackRad(T, d, R)
% �����¶�T��������������
% T: �¶�, ����: K
% r: ����, ����: km
% d: ����ֱ��, ����: m
%
stefan_boltzmann = 5.670367E-8; % Stefan-Boltzmann����, ����: W?m?2?K?4
R = R * 1000;
wl= 2.898E6/T;
watt=stefan_boltzmann*T^4*(d/R)^2/pi/4; % W?m?2
mag=Watt2Mag(watt);
photo=Watt2Photo(watt, wl)
end
