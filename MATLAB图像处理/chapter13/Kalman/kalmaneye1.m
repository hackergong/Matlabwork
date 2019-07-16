clear
clc
A = [1,1;0,1];
B = [1/2,1]';
C = [1,0];
x1(1)= 29;                         %��ʼ��
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
    xk=A*x+B*u;                          %KF  ����1
    xg1(k)=xk(1);
    xg2(k)=xk(2);
    P=A*P*A'+Q;                          %KF  ����2  
    Kk=P*C'/(C*P*C'+R);                  %KF  ����3
    x=xk+Kk*(z(k)-C*xk);                 %KF  ����4
    x1(k)=x(1);
    x2(k)=x(2);
    e1(k)=x1(k)-xg1(k);
    e2(k)= x2(k)-xg2(k);
    P=(I-Kk*C)*P;                        %KF  ����5 
end
k=1:20;
figure(1)
plot(k,x1,k,xg1)
title('x1(k)�Ĺ���ֵ����ʵֵ����')
legend('x1(k)�Ĺ���ֵ','x1(k)����ʵֵ')
figure(2); 
plot(k,x2,k,xg2)
title('x2(k)�Ĺ���ֵ����ʵֵ����')
legend('x2(k)�Ĺ���ֵ','x2(k)����ʵֵ')
figure (3)
subplot(2,1,1)
plot(k,e1)
title('x1(k)�Ĺ���ֵ����ʵֵ�������')
subplot(2,1,2)
plot(k,e2)
title('x2(k)�Ĺ���ֵ����ʵֵ�������')
figure (4)
plot(k,z)
title('���z�Ĺ۲�ֵ����') 