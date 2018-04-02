function CalcSNR(d,t,n,wl,q)
% 计算星等在不同条件下的信噪比
% d:  光学系统口径, 量纲: 米
% t:  曝光时间, 量纲: 秒
% n:  构成目标的像素数
% wl: 波长, 量纲: 纳米
% q:  量子效率
%
mag=12:0.2:18;     % 星等, 仿真范围: [12, 18]
magmin=mag(1);
magmax=mag(length(mag));
% ps=[4.64 6.19 9.28 12.37];        % 像元张角
ps=[6 12];  % 像元张角: 10微米 pixel, 340mm foces length
RD=15;              % 读出噪声, 量纲: 光电子数
D=1;                % 暗电流数, 量纲: 光电子数/秒/像素
B0=8.9E-7;          % 黄道光辐射强度, 量纲: [W/m^2/Sr/s @500 nm]
% B0 = 3E-5;

snr0=5;     % 信噪比阈值: 5
sqsnr0=snr0*snr0;
SNR5=linspace(snr0,snr0,length(mag));

A=pi*d*d*0.25;      % 接收辐射的面积
sqps=ps.*ps;        % 转换至平方角秒
S=Arcsec2Sr(sqps);  % 平方角秒转换为立体角

photoI=Mag2Photo(mag,wl)*A*q;       % 目标辐射, 量纲: 光电子数
photoB=Watt2Photo(B0*A*S,wl) * q;   % 背景辐射, 量纲: 光电子数

figure;
hold on;
% 计算与绘图
plot(mag,SNR5,'r-');
N=length(ps);
k=80;
for i=1:N
    btot=photoB(i)*n*t+D*t*n+RD*RD*n;
    snr=photoI*t./sqrt(photoI*t+btot);
    photo=(sqsnr0+sqrt(power(snr0,4.0)+4*sqsnr0*btot))*0.5/t/q/A; % 信噪比=snr0=5时的光子数
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
