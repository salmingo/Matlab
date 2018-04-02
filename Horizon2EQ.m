function [ha, dec] = Horizon2EQ(azi, alt, lat)
%Horizon2EQ Transfer Horizontal coordinates into Equtorial coordinates
%
% azi: 方位角, 量纲: 弧度. 采用正南零点
% alt: 高度角, 量纲: 弧度
% lat: 地理纬度, 量纲: 弧度. 采用北纬为正
% ha : 时角, 量纲: 弧度
% dec: 赤纬, 量纲: 弧度
%
% 2017年4月2日
% 卢晓猛   lxm@nao.cas.cn
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
