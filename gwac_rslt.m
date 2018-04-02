function gwac_rslt(pathname)
%
% 绘画GWAC处理结果
%
data=load(pathname);
x=data(:,1);
y=data(:,2);
fit_ra=data(:,3);
fit_de=data(:,4);
flux_mag=data(:,5);
cat_ra=data(:,6);
cat_de=data(:,7);
BT_mag=data(:,8);
VT_mag=data(:,9);
e_ra=(fit_ra-cat_ra)*3600;
e_de=(fit_de-cat_de)*3600;
rms_ra=std(e_ra);
rms_de=std(e_de);

figure;
% subplot(2,2,1),plot(x,y,'r+'),axis([0,3056,0,3056]),grid on, title('X-Y');
subplot(2,2,1),plot(x,y,'r+'),grid on, title('X-Y');
xlabel('X'),ylabel('Y');
subplot(2,2,2),plot(fit_ra,fit_de,'b+',cat_ra,cat_de,'ro'),title('RA-DEC');
xlabel('R.A. [deg]'),ylabel('DEC. [deg]');
legend('拟合坐标','星表坐标');
text(139,-8,['Std(RA) = ', num2str(rms_ra), '″']);
text(139,-9,['Std(DE) = ', num2str(rms_de), '″']);
% subplot(2,2,3),plot(flux_mag,BT_mag,'bo'),title('Instrument-BT');
% xlabel('Instrument Mag, Zero: 20'), ylabel('BT');
subplot(2,2,4),plot(flux_mag,VT_mag,'go'),title('Instrument-VT');
xlabel('Instrument Mag, Zero: 20'), ylabel('VT');
