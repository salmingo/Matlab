function RangeFromOmega(omega0, h)
% omega0: 相对恒星速度, 在观测平台上的相对角速度, 量纲: 角秒/秒
% h     : 相对测站的仰角, 量纲: 角度
%
%
GtoR = pi / 180;             % 角度转换为弧度的系数
StoR = pi / 180 / 3600;      % 角秒转换为弧度的系数
v = 8:1:42;                  % 线速度, 量纲: 千米/秒. 8: 近似第一宇宙速度; 42: 近似第三宇宙速度
psi = 0:1:85;                % 运动方向相对水平方向的夹角
RE = 6.378E3;                % 地球半径, 量纲: 千米
RE2= RE*RE;

omega = (15+omega0)*StoR;    % 相对测站的角速度, 量纲: 弧度
Rpsi = psi*GtoR;              % 转换为弧度
Rh = h*GtoR;                  % 转换为弧度

figure;
hold on;

% 遍历速度, 计算对应的距离
N=length(v);
for i=1:N
    rho = v(i)*cos(Rpsi)/omega;
    r2 = RE2*power(cos(Rh),2.0)+power(rho+RE*sin(Rh),2.0);
    r = sqrt(r2);
    plot(psi,r,'*',psi,r);
end
xlabel('\fontsize{16}\psi [°]');
ylabel('\fontsize{16}range [km]');
title(['相对角速度 = ',num2str(omega0), ' 角秒/秒,  仰角 = ', num2str(h), ' 度']);

end

