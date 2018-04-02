function [azi, alt] = EQ2Horizon(ha, dec, lat)
%EQ2Horizon Transfer Equtorial coordinates into Horizontal coordinates
%
% ha : 时角, 量纲: 弧度
% dec: 赤纬, 量纲: 弧度
% lat: 地理纬度, 量纲: 弧度. 采用北纬为正
% azi: 方位角, 量纲: 弧度. 采用正南零点
% alt: 高度角, 量纲: 弧度
%
% 2017年4月2日
% 卢晓猛   lxm@nao.cas.cn
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
