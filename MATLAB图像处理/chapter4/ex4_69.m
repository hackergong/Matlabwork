shg;R0=1;                   %地球半径为一个单位
a=12*R0;
b=9*R0;
T0=2*pi;                    %T0是轨道周期
T=5*T0;
dt=pi/100;
t=[0:dt:T]';
f=sqrt(a^2-b^2);              %地球与另一焦点的距离
th=12.5*pi/180;              %卫星轨道与x-y平面的倾角
E=exp(-t/20);                 %轨道收缩率
x=E.*(a*sin(t)-f);
y=E.*(b*sin(th)*cos(t));
z=E.*(b*cos(th)*cos(t));
plot3(x,y,z,'g');                %画全程轨迹
[X,Y,Z]=sphere(30);
X=R0*X;Y=R0*Y;Z=R0*Z;   		%获得单位球坐标
grid on,hold on;
surf(X,Y,Z),shading interp;  		 %画地球
x1=-18*R0;X2=6*R0;      		 %确定坐标范围
y1=-12*R0;y2=12*R0;
z1=-6*R0;z2=6*R0;
view ([45 85]), 			 	 %设视角、画运动线
comet3(x,y,z,0.02),
hold off   
