x=-7:0.5:7;
y=x;
[X,Y]=meshgrid(x,y);
R=sqrt(X.^2+Y.^2)+eps;
Z=2*cos(Q)./Q;
surfc(X,Y,Z)
grid on
axis([-10 10 -10 10 -0.5 1.5])
