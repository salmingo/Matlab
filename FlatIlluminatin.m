function FlatIlluminatin(d, f, x, q, w0)
% 依据硬件设备参数, 计算拍摄平场时对天光辐射照度的需求.
% 结合实测结果从而确定合适的平场拍摄时间段
% 输入参数:
% d -- 望远镜口径, 量纲: 米
% f -- 焦距, 量纲: 米
% x -- 像元大小, 量纲: 微米
% q -- 系统量子效率, 百分比
% w0-- 满阱阱深, 量纲: e-
% t -- 曝光时间, 量纲: 秒.  约定: 5≤t≤15
%
% 输出参数:
%
% 中间参数:
% w: 有效井深, 量纲: e-.  约定: 0.5≤w/w0≤0.8
% wl:中心波长, 量纲: 纳米. 约定: 550nm
%
t = 5:1:15;  % 曝光时间
w = [0.4 0.5 0.6 0.7 0.8] * w0; % 辐射照度在势阱中单位时间积分电子的数量, 满阱50-80%
wl= 550;  % 中心波长, 量纲: 纳米
A = pi * d * d * 0.25; % 主镜面积, 量纲: 平方米
ps= x * 1E-6 * 180 * 3600 / f / pi; % 像元张角, 量纲: 角秒
ps2 = ps * ps; % 像元张角面积

hold on;
title('Simulation：Sky Brightness Requirements for Flat Image');
xlabel('Exposure Time [second]');
ylabel('Sky Brightness [mag?arcsec^-2]');
nw = length(w);
for i=1:nw
    w1 = w(i) ./ t;
    mag = Photo2Mag((w1 / A / ps2 / q), wl);
    plot(t,mag,'o-');
end
