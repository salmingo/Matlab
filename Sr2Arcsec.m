function [ret]=Sr2Arcsec(sr)
% 立体弧度转换至平方角秒
RtoS=2.062648062470964E5; % 弧度=>角秒
ret=sr*RtoS*RtoS;
