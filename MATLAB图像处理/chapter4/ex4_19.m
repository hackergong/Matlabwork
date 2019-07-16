t=(1/14:1/7:1)'*2*pi; %定义七角形的刻度
x=sin(t);y=cos(t);
H=fill(x,y,'r');
axis square
set(H,'LineWidth',5)  %设置七角形的边线宽度
set(gcf,'color','w','Position',[400,350,250,150],'MenuBar','none')
set(gca,'Visible','off') %隐藏坐标轴    
