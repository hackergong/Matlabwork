I=imread('eight.tif');
figure(1)
subplot(2,3,1);imshow(I)
title('ԭʼͼ��')
subplot(2,3,2);imhist(I)            %��ʾͼ���ֱ��ͼ
title('ֱ��ͼ')            
I0=edge(I,'sobel');                 %�Զ�ѡ����ֵ��sobel�㷨
I1=edge(I,'sobel',0.06);            %ָ����ֵΪ0.06
I2=edge(I,'sobel',0.04);            %ָ����ֵΪ0.04
I3=edge(I,'sobel',0.02);            %ָ����ֵΪ0.02
subplot(2,3,3);imshow(I0)                
title('Ĭ������')
subplot(2,3,4);imshow(I1)                     
title('��ֵΪ0.06')
subplot(2,3,5);imshow(I2)
title('��ֵΪ0.04')
subplot(2,3,6);imshow(I3)
title('��ֵΪ0.02')
