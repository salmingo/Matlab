function pvgram(dirname)
% �滭Ŀ¼�µ�����TXT�ļ�, �鿴��ȡ��λ�ñ仯Դ

if dirname(end) ~= '/'
    dirname=[dirname,'/'];
end

figure;
hold on;

dirs=dir([dirname, '*.txt']);
n=length(dirs);
for i=1:n
    pathname=[dirname,dirs(i).name];
    data=load(pathname);
    x=data(:,9);
    y=data(:,10);
    plot(x,y,'o',x,y);
end

% data=load(dirname);
% t=data(:,6)+data(:,7)/60.0+data(:,8)/3600.0;
% x=data(:,9);
% y=data(:,10);
% 
% plot(t,x,'o',t,y,'x');
