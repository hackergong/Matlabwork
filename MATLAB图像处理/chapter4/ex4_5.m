clear all;
x = -pi:pi/9:pi;
y = tan(cos(x)) - cos(tan(x));
plot(x,y,'--rs','LineWidth',2,...
                'MarkerEdgeColor','w',...
                'MarkerFaceColor','r',...
                'MarkerSize',9)
