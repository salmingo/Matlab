function [ret]=RevolutionSpeed(M, r)
% 计算天体受万有引力作用, 在球模型下的公转速度
% M:   中心天体质量, 量纲: Kg
% r:   天体之间质心距离, 量纲: m
% ret(1): 角速度, 量纲: arc/sec
% ret(2): 线速度, 量纲: m/sec
%
G = 6.67408E-11;   % 万有引力常量
ret(1) = sqrt(G*M/power(r,3.0));
ret(2) = ret(1)*r;
