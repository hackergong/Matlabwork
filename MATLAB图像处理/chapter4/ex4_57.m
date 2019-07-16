t=0:pi/10:2*pi;
[X,Y,Z]=cylinder(1.5+sin(t));
surf(X,Y,Z);
axis square
