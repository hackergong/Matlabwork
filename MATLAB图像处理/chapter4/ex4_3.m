clear all;
x=0:0.15:3*pi;
y=cos(x);
line(x,y);
axis([0 7 -1.5 1.5]);
xlabel('x');
ylabel('y');
title('cos(x)')
