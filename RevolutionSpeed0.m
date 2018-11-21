function [ret]=RevolutionSpeed0(h)
% 计算受万有引力作用, 在球模型下绕地(人造)天体的公转速度
% h: 天体轨道高度, 量纲: km
% ret(1): 角速度, 量纲: arc/sec
% ret(2): 线速度, 量纲: m/sec
% 
M = 5.977E24;    % 地球质量, [?]
R0 = 6.378E6;    % 地球半径, [m]
r=R0+h*1000;
ret=RevolutionSpeed(M,r);
