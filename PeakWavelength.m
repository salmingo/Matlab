function [lamda] = PeakWavelength(T)
% ����ά��λ�ƶ���, ������һ�¶�T�ĺ�������ֵ����
% �������:
% T     : �¶�, K
% �������:
% lamda : ����, nm
% 
b = 2.8977721E-3;  % ά��λ�Ƴ���, m.K
lamda = b * 1E9 / T;
end

