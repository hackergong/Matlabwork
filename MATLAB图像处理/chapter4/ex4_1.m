clear all;          
%׼������
x=0:0.01:3*pi;
y1=sin(x);
y2=sin(2*x);
y3=sin(3*x);
%���õ�ǰ��ͼ��
figure;
%��ͼ
plot(x,y1,x,y2,x,y3);
%���������������������
axis([0 8 -2 2]);
grid on;
%��עͼ��
xlabel('x');
ylabel('y');
title('��ʾ��ͼ��������')
legend('sin(x)','sin(2x)','sin(3x)')
legend('sin(x)','sin(2x)','sin(3x)')
