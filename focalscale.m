function [ret]=focalscale(flen)
% �������������
% flen : ����, ����: ��
% ret  : ���������, ����: ����/��
%
RtoS = 180 * 3600 / pi;
ret = RtoS / flen;
