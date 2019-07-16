[X0,Y0,Z0]=sphere(45);       %产生单位球面的三维坐标
x=3*X0;                   %产生半径为2的球面的三维坐标
y=3*Y0;
z=3*Z0;
clf,surf(X0,Y0,Z0);            %画单位球面
shading interp;              %采用插补明暗处理
hold on
mesh(x,y,z);
colormap(hot);
hold off;                   %采用hot色彩 
hidden off;                 %产生透视效果
axis equal;
axis off;                    %不显示坐标轴
