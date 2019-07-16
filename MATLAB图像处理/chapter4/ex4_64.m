clf;
t=linspace(0,2*pi,90);
r=1-exp(-t/2).*sin(4*t);            %旋转母线
[X,Y,Z]=cylinder(r,60);              %产生旋转柱面数据
ii=find(X<0&Y<0);                 %确定x-y平面第四象限上的数据下标
Z(ii)=NaN;                       %剪切
surf(X,Y,Z);
colormap(spring);
shading interp;
light('position',[-3,-1,3],'style','local');  %设置光源
material([0.5,0.4,0.3,10,0.3]);        %设置表面反射
