function CameraLimit(varargin)
%function CameraLimit(d, f, pix, t, rs, q, rn, wl)
% 计算在恒星跟踪模式下相机的理论极限探测能力
% 
% d   : 口径, 量纲: 毫米
% f   : 焦距, 量纲: 毫米
% pix : 像素边长, 量纲: 微米
% t   : 曝光时间
% rs  : 观测目标相对运动速度, arcsec/second
% q   : 系统量子效率
% rn  : 读出噪声, e-/pixel
% wl  : 等效波长, 量纲: 纳米
%
% 默认参数:
% 1) 夜天光: 22mag/arcsec^2
% 2) 理想点像能量分布范围: 2×2pixel
% 3) 最小积分信噪比 : 5
%
% 卢晓猛, 2018年4月9日
%
% 输入参数缺省值
%d    = 240;
%f    = 360;
%pix  = 10;
d = 500;
f = 4000;
pix = 12;
t    = 1;
rs   = 0;
q    = 0.4;
rn   = 10;
wl   = 600;

% 输入参数
if nargin >= 1
    d = varargin{1};
    if d < 10
        error('telescope diameter should not be less than 10');
    end
end

if nargin >= 2
    f = varargin{2};
    if f < 10
        error('telescope focus length should not be less than 10');
    end
end

if nargin >= 3
    pix = varargin{3};
    if pix < 3
        error('pixel size should not be less than 3');
    end
end

if nargin >= 4
    t = varargin{4};
    if t < 0.01
        error('exposure duration should not be less than 0.01');
    end
end

if nargin >= 5
    rs = varargin{5};
    if rs < 0
        rs = -rs;
    end
end

if nargin >= 6
    q = varargin{6};
    if (q <= 0.01) || (q > 1)
        error('quantum efficiency should be between 0 and 1');
    end
end

if nargin >= 7
    rn = varargin{7};
    if rn < 0
        error('read-noise should not be less than 0');
    end
end

if nargin >= 8
    wl = varargin{8};
    if (wl < 300) || (wl > 1000)
        error('wave length should be between 300 and 1000');
    end
end

% 缺省值
back = Mag2Photo(22, wl) * q; % e-/arcsec^2
snr1 = 5; % 最小积分信噪比
R2AS = 180 * 3600 / pi;  % 弧度=>角秒系数

% 计算: 为达到可探测性, 需要在相机上累积的能量
ps = pix * 0.001 * R2AS / f; % 像元比例尺, arcsec/pixel
backpix = back * ps * ps; % 夜天光单像素电子数, e-/pixel
npix = 2 * (2 + rs*t/ps+0.5);  % 构成星像的像素数
% 在相机上累积的能量
s0 = (snr1.^2 + sqrt(snr1.^4+4*snr1.^2*npix*(backpix + rn * rn))) * 0.5 + backpix * npix;
s1 = s0 / q;  % 经过系统前的能量

A = 0.25E-6*pi*d.^2;   % 接收辐射的面积, 平方米


end
