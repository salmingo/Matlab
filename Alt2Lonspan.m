function [t1, t2]=Alt2Lonspan(h0, H, phi, lon)
% 计算在指定地理纬度，确定轨道高度目标为约定高度角时的可选择测站区域
% h0 : 高度角, 量纲: 角度
% H  : 轨道高度, 量纲: 公里
% phi: 地理纬度, 量纲: 角度
% lon: 地理经度, 量纲: 角度
%
G2R = pi/180;
h0 = h0*G2R;
phi = phi*G2R;
H0 = 6378;
dec = H0*G2R/(H0+H);
if phi > 0
    dec = -dec;
end

cost=(sin(h0)-sin(phi)*sin(dec))/cos(phi)/cos(dec);
dt=acos(cost)*180/pi;
t1=lon-dt;
t2=lon+dt;
end
