x=-5:5;
y1=randn(size(x));
y2=sin(x);
subplot(2,1,1)
hold
hold	%�л���ͼ1�ĵ��ӻ�ͼģʽ���ر�״̬
plot(x,y1,'b')
plot(x,y2,'r')	%�µĻ�ͼָ������ԭ���Ļ�ͼ���
title('hold off ')
subplot(2,1,2)
hold on	%����ͼ2�ĵ��ӻ�ͼģʽ
plot(x,y1,'b')
plot(x,y2,'r')	%�µĻ�ͼ���������ԭ����ͼ����
title('hold on ')    
