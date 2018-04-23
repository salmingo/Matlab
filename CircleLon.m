function CircleLon
% 以基准圆为参考，绘制不同经度在圆周的分布范围
lon_min=[
    -131.4  % chile
    61.5    % xinglong
    17.5     % mustag
    ];
lon_max=[
    -10.2   % chile
    173.7   % xinlong
    132.1    % mustag
    ];

G2R = pi/180;
n=length(lon_min);
r=10;   % 半径

t = (0:pi/100:pi*2);
X = r * sin(t);
Y = r * cos(t);

figure;

plot(X,Y,'LineWidth',2);
axis square;
hold on;

for i =1:n
    t=(lon_min(i)*G2R:pi/100:lon_max(i)*G2R);
    r=r+0.5;
    X=r*sin(t);
    Y=r*cos(t);
    plot(X,Y,'LineWidth',2);
end

r = r + 1;
x = [0 0];
y = [-r r];
line(x,y);

text(0,10.5,'0');
text(0,-10.5,'180');

end
