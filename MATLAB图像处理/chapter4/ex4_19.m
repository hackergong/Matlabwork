t=(1/14:1/7:1)'*2*pi; %�����߽��εĿ̶�
x=sin(t);y=cos(t);
H=fill(x,y,'r');
axis square
set(H,'LineWidth',5)  %�����߽��εı��߿��
set(gcf,'color','w','Position',[400,350,250,150],'MenuBar','none')
set(gca,'Visible','off') %����������    
