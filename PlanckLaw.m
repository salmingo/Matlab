function [IL, IV] = PlanckLaw(T, lamda)
% 依据普朗克黑体辐射定律, 计算在温度T下，与波长波长对应的辐射率
% 输入参数:
% T     : 温度, K
% lamda : 波长, nm
% 输出参数:
% V     : 波长对应的频率, Hz
% IL    : 波长对应的辐射率, W.m^-2.Sr^-1.m^-1
% IV    : 频率对应的辐射率, W.m^-2.Sr^-1.Hz^-1
%
% 定义常数项:
h = 6.62607015E-34; % 普朗克常数, J.s
c = 299792458;      % 光速, m.s^-1
k = 1.380649E-23;   % 玻尔兹曼常数, J/K
% 计算公式
L = lamda * 1E-9;   % 波长, m
V = c./L;        % 频率, Hz, s^-1
IL = 2 * h * c^2 * L.^-5 .* (exp(h * c * (L * k * T).^-1) - 1).^-1;
IV = 2 * h * V.^3 * c^-2 .* (exp(h * V * (k * T)^-1) - 1) .^ -1;
end
