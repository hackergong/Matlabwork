x=[2004:1:2013];
y=[1.45 0.91 2.3 0.86 1.46 0.95 1.0 0.96 1.21 0.74];
xin=2004:0.2:2013;
yin=spline(x,y,xin);
plot(x,y,'ob',xin,yin,'-.r')
title('2004�굽2013�걱����ƽ����ˮ��ͼ')
xlabel('���','FontSize',10)
ylabel('ÿ�꽵����','FontSize',10)
