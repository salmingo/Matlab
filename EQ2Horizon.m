function [azi, alt] = EQ2Horizon(ha, dec, lat)
%EQ2Horizon Transfer Equtorial coordinates into Horizontal coordinates
%
% ha : ʱ��, ����: ����
% dec: ��γ, ����: ����
% lat: ����γ��, ����: ����. ���ñ�γΪ��
% azi: ��λ��, ����: ����. �����������
% alt: �߶Ƚ�, ����: ����
%
% 2017��4��2��
% ¬����   lxm@nao.cas.cn
%
slat = sin(lat);
clat = cos(lat);
cha  = cos(ha);
pi2  = pi*2;

azi = atan2(sin(ha), cha * slat - tan(dec) * clat);
alt = asin(slat * sin(dec) + clat * cos(dec) .* cha);

n = length(azi);
for i=1:n
    if azi(i) < 0
        azi(i) = azi(i) + pi2;
    end
end
end
