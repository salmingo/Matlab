function CameraLimit(varargin)
%function CameraLimit(d, f, pix, t, rs, q, rn, wl)
% �����ں��Ǹ���ģʽ����������ۼ���̽������
% 
% d   : �ھ�, ����: ����
% f   : ����, ����: ����
% pix : ���ر߳�, ����: ΢��
% t   : �ع�ʱ��
% rs  : �۲�Ŀ������˶��ٶ�, arcsec/second
% q   : ϵͳ����Ч��
% rn  : ��������, e-/pixel
% wl  : ��Ч����, ����: ����
%
% Ĭ�ϲ���:
% 1) ҹ���: 22mag/arcsec^2
% 2) ������������ֲ���Χ: 2��2pixel
% 3) ��С��������� : 5
%
% ¬����, 2018��4��9��
%
% �������ȱʡֵ
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

% �������
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

% ȱʡֵ
back = Mag2Photo(22, wl) * q; % e-/arcsec^2
snr1 = 5; % ��С���������
R2AS = 180 * 3600 / pi;  % ����=>����ϵ��

% ����: Ϊ�ﵽ��̽����, ��Ҫ��������ۻ�������
ps = pix * 0.001 * R2AS / f; % ��Ԫ������, arcsec/pixel
backpix = back * ps * ps; % ҹ��ⵥ���ص�����, e-/pixel
npix = 2 * (2 + rs*t/ps+0.5);  % ���������������
% ��������ۻ�������
s0 = (snr1.^2 + sqrt(snr1.^4+4*snr1.^2*npix*(backpix + rn * rn))) * 0.5 + backpix * npix;
s1 = s0 / q;  % ����ϵͳǰ������

A = 0.25E-6*pi*d.^2;   % ���շ�������, ƽ����


end
