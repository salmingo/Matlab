function [lamda] = PeakWavelength(T)
% 依据维恩位移定律, 计算任一温度T的黑体辐射峰值波长
% 输入参数:
% T     : 温度, K
% 输出参数:
% lamda : 波长, nm
% 
b = 2.8977721E-3;  % 维恩位移常数, m.K
lamda = b * 1E9 / T;
end

