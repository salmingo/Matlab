function [t1, t2]=Alt2Lonspan(h0, H, phi, lon)
% ������ָ������γ�ȣ�ȷ������߶�Ŀ��ΪԼ���߶Ƚ�ʱ�Ŀ�ѡ���վ����
% h0 : �߶Ƚ�, ����: �Ƕ�
% H  : ����߶�, ����: ����
% phi: ����γ��, ����: �Ƕ�
% lon: ������, ����: �Ƕ�
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
