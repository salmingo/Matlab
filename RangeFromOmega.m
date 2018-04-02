function RangeFromOmega(omega0, h)
% omega0: ��Ժ����ٶ�, �ڹ۲�ƽ̨�ϵ���Խ��ٶ�, ����: ����/��
% h     : ��Բ�վ������, ����: �Ƕ�
%
%
GtoR = pi / 180;             % �Ƕ�ת��Ϊ���ȵ�ϵ��
StoR = pi / 180 / 3600;      % ����ת��Ϊ���ȵ�ϵ��
v = 8:1:42;                  % ���ٶ�, ����: ǧ��/��. 8: ���Ƶ�һ�����ٶ�; 42: ���Ƶ��������ٶ�
psi = 0:1:85;                % �˶��������ˮƽ����ļн�
RE = 6.378E3;                % ����뾶, ����: ǧ��
RE2= RE*RE;

omega = (15+omega0)*StoR;    % ��Բ�վ�Ľ��ٶ�, ����: ����
Rpsi = psi*GtoR;              % ת��Ϊ����
Rh = h*GtoR;                  % ת��Ϊ����

figure;
hold on;

% �����ٶ�, �����Ӧ�ľ���
N=length(v);
for i=1:N
    rho = v(i)*cos(Rpsi)/omega;
    r2 = RE2*power(cos(Rh),2.0)+power(rho+RE*sin(Rh),2.0);
    r = sqrt(r2);
    plot(psi,r,'*',psi,r);
end
xlabel('\fontsize{16}\psi [��]');
ylabel('\fontsize{16}range [km]');
title(['��Խ��ٶ� = ',num2str(omega0), ' ����/��,  ���� = ', num2str(h), ' ��']);

end

