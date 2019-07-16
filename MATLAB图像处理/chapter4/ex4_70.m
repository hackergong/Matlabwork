shg;clf;
[X,Y]=meshgrid([-2:.2:2]);
Z=3*X.*exp(-X.^2-Y.^2);
G=gradient(Z);
subplot(121),
surf(X,Y,Z,G);
subplot(122),
h=surf(X,Y,Z,G);
rotate(h,[-2,-2,0],20,[2,2,0]),   %Ê¹Í¼ÐÎÐý×ª
colormap(jet)
