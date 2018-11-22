function [l0, EL, EF] = BlackBody(T, d, R, dl)
% 计算温度T、半径r、观测距离R的物体, 当符合黑体辐射规律时的辐射特性
% 物体大小相对距离可视为点目标
%
% 输入参数:
% T : 温度, K
% d : 物体直径, m, 圆形
% R : 观测距离, m
% dl: 相对中心波长的积分范围, um, 即积分区间是: [l0-dl/2, l0+dl/2]
%
% 输出参数:
% l0: 峰值波长, nm
% EL: 波长光谱辐照度, W.m^-2.m^-1
% EF: 频率光谱辐照度, W.m^-2.Hz^-1
% 
% 常数项:
h = 6.62607015E-34; % 普朗克常数, J.s
c = 299792458;      % 光速, m.s^-1
k = 1.380649E-23;   % 玻尔兹曼常数, J/K

%
dl = dl * 0.5E3; % 波长积分半长, nm
l0 = PeakWavelength(T); % 峰值波长, nm
Sr = (d/R)^2;   % 立体角, sr
fprintf("峰值波长 = %G [nm]\n", l0);

% 函数:
% 频率
% freq = c*1E9/l;
%
% 光谱辐照度
% IL = 2 * h * c^2 * L.^-5 .* (exp(h * c * (L * k * T).^-1) - 1).^-1;  W.m^-2.Sr^-1.m^-1
% IF = 2 * h * f.^3 * c^-2 .* (exp(h * f * (k * T)^-1) - 1) .^ -1;     W.m^-2.Sr^-1.Hz^-1
freq  = @(c, l) c*1E9/l;
SpectralIL = @(h, c, k, T, l) 2 * h * c^2 * l.^-5 .* (exp(h * c * (l * k * T).^-1) - 1).^-1;
SpectralIF = @(h, c, k, T, f) 2 * h * f.^3 * c^-2 .* (exp(h * f * (k * T)^-1) - 1) .^ -1;
%

% 峰值波长光谱辐照度
f0 = freq(c, l0); % 峰值波长对应频率
EL = SpectralIL(h, c, k, T, l0*1E-9) * Sr * 1E-6; % W.m^-2.um^-1
EF = SpectralIF(h, c, k, T, f0) * Sr;             % W.m^-2.Hz^-1
mag_ab = -2.5*log10(EF) - 56.1;

fprintf("峰值波长单色辐照度 = %G [W.m^-2.um^-1]\n", EL);
fprintf("峰值波长单色辐照度 = %G [W.m^-2.Hz^-1]\n", EF);
fprintf("AB星等 = %G\n", mag_ab);

% 波长积分辐照度, W.m^-2, 积分范围: [l1, l2]
l1 = (l0 - dl)*1E-9;
l2 = (l0 + dl)*1E-9;   % [l1, l2]: 积分区间, m
PowerL = @(h, c, k, T) integral(@(l) 2 * h * c^2 * l.^-5 .* (exp(h * c * (l * k * T).^-1) - 1).^-1, l1, l2);
PL = PowerL(h, c, k, T) * Sr; % W.m^-2
mag_bol = -2.5 * log10(PL / 2.52E-8);
fprintf("视热星等 = %G\n", mag_bol);

% 光子数
n = Watt2Photo(PL, l0);
fprintf("光子数 = %d\n", n);

% 单色辐照度-波长
l1 = 6000;
l2 = 16000;   % [l1, l2]: 积分区间, nm
l = l1:100:l2;
plot(l, SpectralIL(h, c, k, T, l), 'b+-');

end
