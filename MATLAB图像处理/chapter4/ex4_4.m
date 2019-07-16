clear all;
theta=linspace(0,3*pi,50);      %圆心角的采样点设置
r=0.4:0.24:1.74;               %半径长度的采样点设置
x=1+cos(theta)'*r;
y=2+sin(theta)'*r;
plot(x,y,1,2,'+');
axis([-1 3 0 4]);
axis equal;
xlabel('x');
ylabel('y');
title('绘制圆');
