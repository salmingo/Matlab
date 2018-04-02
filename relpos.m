function relpos(pathname)
data=load(pathname);
T=data(:,1);  % local mean sidereal time
ra=data(:,2); % relative ra
dc=data(:,3); % relative dec
ra0=data(:,4); % center ra
dc0=data(:,5); % center dec
H=data(:,6);   % center ha
CH=cos(H*pi/180);
SH=sin(H*pi/180);
CD=cos(dc0*pi/180);
SD=sin(dc0*pi/180);
CHCD=CH.*CD;
CHSD=CH.*SD;
SHCD=SH.*CD;
SHSD=SH.*SD;
figure;
plot(T,ra.*SHSD,'ro');
figure;
plot(T,dc.*SHSD,'go');
