function [ret] = focallen(pixel_size, pixel_scale)
% ����Ԫ�߳�����Ԫ�ŽǼ��㽹��
% pixel_size  : ��Ԫ�߳�, ����: ΢��
% pixel_scale : ����Ԫ�߳���Ӧ�ռ��Ž�, ����: ����
% ret         : ����, ����: ��
%
RtoS = 180 * 3600 / pi;  % ����������ת��ϵ��
ret=pixel_size*1E-6*RtoS/pixel_scale;
