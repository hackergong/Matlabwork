[X,Y]=meshgrid(-1.5:0.25:1.5,-1:0.2:1);
Z=X.*exp(-X.^2-Y.^2);
[U,V,W]=surfnorm(X,Y,Z);    %空间表面的法线 
quiver3(X,Y,Z,U,V,W,0.5);
hold on;
surf(X,Y,Z);
colormap hsv;
view(-45,60);
axis([-3 3 -1 1 -0.6 0.6]);
hold off
