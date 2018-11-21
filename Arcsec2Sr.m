function [ret]=Arcsec2Sr(sas)
% 平方角秒转换为立体弧度
StoR=4.848136811095360E-06;
ret=sas*StoR*StoR;
