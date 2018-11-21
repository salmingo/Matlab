function pvhough(pathname)
% 计算线段的霍夫变换结果
%
data=load(pathname);
xs=data(:,10);
ys=data(:,11);
hh=data(:,6);
mm=data(:,7);
ss=data(:,8);
ms=data(:,9);
tt=hh*3600+mm*60+ss+ms*1E-6;
N=length(xs);

figure;
subplot(2,1,1);
plot(xs,ys,'r*',xs,ys);

hold on;
for i=2:N
    dt=tt(i)-tt(i-1);
    dx(i-1) = (xs(i)-xs(i-1))/dt;
    dy(i-1) = (ys(i)-ys(i-1))/dt;
%     theta = atan2(dx,-dy);
%     r1=xs(i-1)*cos(theta)+ys(i-1)*sin(theta);
%     r2=xs(i)*cos(theta)+ys(i)*sin(theta);
%     x1(i-1) = r1 * cos(theta);
%     y1(i-1) = r1 * sin(theta);
%     x2(i-1) = r2 * cos(theta);
%     y2(i-1) = r2 * sin(theta);
end
subplot(2,1,2);
% plot(x1,y1,'r*',x2,y2,'bo');
plot(dx,dy,'r*',dx,dy);

end
