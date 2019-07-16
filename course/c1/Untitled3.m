clear all
x=linspace(-2,2,21);
y=linspace(-2,2,21);
[X,Y]=meshgrid(x,y);
Z1=4*X-8*Y.^2;
Z2=2*X-3*Y;
mesh(X,Y,Z1);
hold on;
mesh(X,Y,Z2);