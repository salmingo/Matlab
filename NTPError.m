function NTPError(pathname)
% 评估NTP时钟校验误差
% 文件内容分三列:
% 列1: 本机时钟
% 列2: 与本机时钟对应, NTP校正后时钟
% 列3: 网络延迟
%
data=load(pathname);
ltm=data(:,1);
tmc=data(:,2);
delay=data(:,3);
offset=tmc-ltm;

figure;
subplot(2,2,1:2);
plot(tmc,offset,'bo');
grid on;
title('local time Corrected -- Offset <tmc - ltm>');
xlabel('Corrected Time [sec]');
ylabel('Offset [sec]');

subplot(2,2,3);
plot(tmc,delay,'r+');
grid on;
title('Local Time Corrected -- Delay');
xlabel('Corrected Time [sec]');
ylabel('Delay [sec]');

subplot(2,2,4);
plot(offset,delay,'r+');
grid on;
title('Offset -- Delay');
xlabel('Offset [sec]');
ylabel('Delay [sec]');
