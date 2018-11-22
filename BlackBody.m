function [l0, EL, EF] = BlackBody(T, d, R, dl)
% �����¶�T���뾶r���۲����R������, �����Ϻ���������ʱ�ķ�������
% �����С��Ծ������Ϊ��Ŀ��
%
% �������:
% T : �¶�, K
% d : ����ֱ��, m, Բ��
% R : �۲����, m
% dl: ������Ĳ����Ļ��ַ�Χ, um, ������������: [l0-dl/2, l0+dl/2]
%
% �������:
% l0: ��ֵ����, nm
% EL: �������׷��ն�, W.m^-2.m^-1
% EF: Ƶ�ʹ��׷��ն�, W.m^-2.Hz^-1
% 
% ������:
h = 6.62607015E-34; % ���ʿ˳���, J.s
c = 299792458;      % ����, m.s^-1
k = 1.380649E-23;   % ������������, J/K

%
dl = dl * 0.5E3; % �������ְ볤, nm
l0 = PeakWavelength(T); % ��ֵ����, nm
Sr = (d/R)^2;   % �����, sr
fprintf("��ֵ���� = %G [nm]\n", l0);

% ����:
% Ƶ��
% freq = c*1E9/l;
%
% ���׷��ն�
% IL = 2 * h * c^2 * L.^-5 .* (exp(h * c * (L * k * T).^-1) - 1).^-1;  W.m^-2.Sr^-1.m^-1
% IF = 2 * h * f.^3 * c^-2 .* (exp(h * f * (k * T)^-1) - 1) .^ -1;     W.m^-2.Sr^-1.Hz^-1
freq  = @(c, l) c*1E9/l;
SpectralIL = @(h, c, k, T, l) 2 * h * c^2 * l.^-5 .* (exp(h * c * (l * k * T).^-1) - 1).^-1;
SpectralIF = @(h, c, k, T, f) 2 * h * f.^3 * c^-2 .* (exp(h * f * (k * T)^-1) - 1) .^ -1;
%

% ��ֵ�������׷��ն�
f0 = freq(c, l0); % ��ֵ������ӦƵ��
EL = SpectralIL(h, c, k, T, l0*1E-9) * Sr * 1E-6; % W.m^-2.um^-1
EF = SpectralIF(h, c, k, T, f0) * Sr;             % W.m^-2.Hz^-1
mag_ab = -2.5*log10(EF) - 56.1;

fprintf("��ֵ������ɫ���ն� = %G [W.m^-2.um^-1]\n", EL);
fprintf("��ֵ������ɫ���ն� = %G [W.m^-2.Hz^-1]\n", EF);
fprintf("AB�ǵ� = %G\n", mag_ab);

% �������ַ��ն�, W.m^-2, ���ַ�Χ: [l1, l2]
l1 = (l0 - dl)*1E-9;
l2 = (l0 + dl)*1E-9;   % [l1, l2]: ��������, m
PowerL = @(h, c, k, T) integral(@(l) 2 * h * c^2 * l.^-5 .* (exp(h * c * (l * k * T).^-1) - 1).^-1, l1, l2);
PL = PowerL(h, c, k, T) * Sr; % W.m^-2
mag_bol = -2.5 * log10(PL / 2.52E-8);
fprintf("�����ǵ� = %G\n", mag_bol);

% ������
n = Watt2Photo(PL, l0);
fprintf("������ = %d\n", n);

% ��ɫ���ն�-����
l1 = 6000;
l2 = 16000;   % [l1, l2]: ��������, nm
l = l1:100:l2;
plot(l, SpectralIL(h, c, k, T, l), 'b+-');

end
