clear
clc
A = [1,1;0,1];
B = [1/2,1]';
C = [1,0];
x1(1)= 29;                         %初始化
x2(1)= 25;
x = [x1(1),x2(1)]';
P = [1,0;0,1];
Q=[2,0;0,1];
R = 10; 
g=0.98;
u=-g;
I=eye(2);
z=[25,26,27,29,30,30,32,33,35,38,39,41,45,46,50,51,52,58,60,60];
for k=2:20
    xk=A*x+B*u;                          %KF  方程1
    xg1(k)=xk(1);
    xg2(k)=xk(2);
    P=A*P*A'+Q;                          %KF  方程2  
    Kk=P*C'/(C*P*C'+R);                  %KF  方程3
    x=xk+Kk*(z(k)-C*xk);                 %KF  方程4
    x1(k)=x(1);
    x2(k)=x(2);
    e1(k)=x1(k)-xg1(k);
    e2(k)= x2(k)-xg2(k);
    P=(I-Kk*C)*P;                        %KF  方程5 
end
k=1:20;
figure(1)
plot(k,x1,k,xg1)
title('x1(k)的估计值和真实值曲线')
legend('x1(k)的估计值','x1(k)的真实值')
figure(2); 
plot(k,x2,k,xg2)
title('x2(k)的估计值和真实值曲线')
legend('x2(k)的估计值','x2(k)的真实值')
figure (3)
subplot(2,1,1)
plot(k,e1)
title('x1(k)的估计值和真实值误差曲线')
subplot(2,1,2)
plot(k,e2)
title('x2(k)的估计值和真实值误差曲线')
figure (4)
plot(k,z)
title('输出z的观测值曲线') 