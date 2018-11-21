function CalcSNR(d,t,n,wl,q)
% �����ǵ��ڲ�ͬ�����µ������
% d:  ��ѧϵͳ�ھ�, ����: ��
% t:  �ع�ʱ��, ����: ��
% n:  ����Ŀ���������
% wl: ����, ����: ����
% q:  ����Ч��
%
mag=12:0.2:18;     % �ǵ�, ���淶Χ: [12, 18]
magmin=mag(1);
magmax=mag(length(mag));
% ps=[4.64 6.19 9.28 12.37];        % ��Ԫ�Ž�
ps=[6 12];  % ��Ԫ�Ž�: 10΢�� pixel, 340mm foces length
RD=15;              % ��������, ����: �������
D=1;                % ��������, ����: �������/��/����
B0=8.9E-7;          % �Ƶ������ǿ��, ����: [W/m^2/Sr/s @500 nm]
% B0 = 3E-5;

snr0=5;     % �������ֵ: 5
sqsnr0=snr0*snr0;
SNR5=linspace(snr0,snr0,length(mag));

A=pi*d*d*0.25;      % ���շ�������
sqps=ps.*ps;        % ת����ƽ������
S=Arcsec2Sr(sqps);  % ƽ������ת��Ϊ�����

photoI=Mag2Photo(mag,wl)*A*q;       % Ŀ�����, ����: �������
photoB=Watt2Photo(B0*A*S,wl) * q;   % ��������, ����: �������

figure;
hold on;
% �������ͼ
plot(mag,SNR5,'r-');
N=length(ps);
k=80;
for i=1:N
    btot=photoB(i)*n*t+D*t*n+RD*RD*n;
    snr=photoI*t./sqrt(photoI*t+btot);
    photo=(sqsnr0+sqrt(power(snr0,4.0)+4*sqsnr0*btot))*0.5/t/q/A; % �����=snr0=5ʱ�Ĺ�����
    mag0=Photo2Mag(photo,wl);
    
    plot(mag,snr);
    if mag0>=magmin && mag0<=magmax
        plot(mag0,snr0,'r*');
    end
    text(15,k,['\fontsize{18}\bf\it<', num2str(ps(i)), '> = ', num2str(mag0)]);
    k=k-5;
end

text(mag(1)+0.1,5,'\fontsize{14}\bf\itSNR=5');
xlabel('mag');
ylabel('SNR');
