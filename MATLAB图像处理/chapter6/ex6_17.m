clear all;
I=imread('rice.png');
I1=uint16(I);       %ת��ͼ��Ϊuint16����
I2=immultiply(I1,I1);  %ͼ���Գ�
I3=immultiply(I,1.2);  %ͼ����������
I4=immultiply(I,0.6);    %ͼ����С����
subplot(2,2,1),imshow(I);
title ('ԭʼͼ��')
subplot(2,2,2),
imshow(I2);
title ('ͼ���Գ�')
subplot(2,2,3),
imshow(I3);
title ('ͼ����������')
subplot(2,2,4),
imshow(I4); 
title ('ͼ����С����')
