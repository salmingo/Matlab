function [ret] = focallen(pixel_size, pixel_scale)
% 由像元边长和像元张角计算焦距
% pixel_size  : 像元边长, 量纲: 微米
% pixel_scale : 单像元边长对应空间张角, 量纲: 角秒
% ret         : 焦距, 量纲: 米
%
RtoS = 180 * 3600 / pi;  % 弧度至角秒转换系数
ret=pixel_size*1E-6*RtoS/pixel_scale;
