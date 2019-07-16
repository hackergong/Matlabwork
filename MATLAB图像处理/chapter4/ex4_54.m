[X,Y,Z]=peaks; %x,y及z轴的数据由peaks函数定义
subplot(221),
contour(Z,30)
subplot(222),contour(X,Y,Z,20);   % 画出peaks的z轴二维等值线图，等值线的数目为20
subplot(223),      %画出peaks的二维等值线图，等值线的数目为20
contour3(Z,30);
subplot(224),      % 画出peaks的z轴三维等值线图
contour3(X,Y,Z,20);    %画出peaks的三维等值线图
