shg;n=12;
t=n*pi*(0:0.0006:1);
x=sin(t);y=cos(t);
plot(x,y,'g');
axis square;
hold on
comet(x,y,0.01);
hold off
