clear all;
theta=linspace(0,3*pi,50);      %Բ�ĽǵĲ���������
r=0.4:0.24:1.74;               %�뾶���ȵĲ���������
x=1+cos(theta)'*r;
y=2+sin(theta)'*r;
plot(x,y,1,2,'+');
axis([-1 3 0 4]);
axis equal;
xlabel('x');
ylabel('y');
title('����Բ');
