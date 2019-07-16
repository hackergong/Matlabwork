shg;R0=1;                   %����뾶Ϊһ����λ
a=12*R0;
b=9*R0;
T0=2*pi;                    %T0�ǹ������
T=5*T0;
dt=pi/100;
t=[0:dt:T]';
f=sqrt(a^2-b^2);              %��������һ����ľ���
th=12.5*pi/180;              %���ǹ����x-yƽ������
E=exp(-t/20);                 %���������
x=E.*(a*sin(t)-f);
y=E.*(b*sin(th)*cos(t));
z=E.*(b*cos(th)*cos(t));
plot3(x,y,z,'g');                %��ȫ�̹켣
[X,Y,Z]=sphere(30);
X=R0*X;Y=R0*Y;Z=R0*Z;   		%��õ�λ������
grid on,hold on;
surf(X,Y,Z),shading interp;  		 %������
x1=-18*R0;X2=6*R0;      		 %ȷ�����귶Χ
y1=-12*R0;y2=12*R0;
z1=-6*R0;z2=6*R0;
view ([45 85]), 			 	 %���ӽǡ����˶���
comet3(x,y,z,0.02),
hold off   
