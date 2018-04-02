function [ha, dec] = Horizon2EQ(azi, alt, lat)
%Horizon2EQ Transfer Horizontal coordinates into Equtorial coordinates
%
% azi: ��λ��, ����: ����. �����������
% alt: �߶Ƚ�, ����: ����
% lat: ����γ��, ����: ����. ���ñ�γΪ��
% ha : ʱ��, ����: ����
% dec: ��γ, ����: ����
%
% 2017��4��2��
% ¬����   lxm@nao.cas.cn
%
slat = sin(lat);
clat = cos(lat);
cazi = cos(azi);
pi2  = pi*2;

ha  = atan2(sin(azi), cazi * slat + tan(alt) * clat);
dec = asin(slat * sin(alt) - clat * cos(alt) .* cazi);

n = length(ha);
for i = 1:n
    if ha < 0
        ha(i) = ha(i) + pi2;
    end
end
end
