function [ret]=focalscale(flen)
% 计算像面比例尺
% flen : 焦距, 量纲: 米
% ret  : 像面比例尺, 量纲: 角秒/米
%
RtoS = 180 * 3600 / pi;
ret = RtoS / flen;
