R=imread('peppers.png');         	%����ͼ��
R2=imadd(R,100);             	%����ͼ�������
subplot(1,2,1),
imshow(R);
title('ԭʼͼ��');
subplot(1,2,2),
imshow(R2);  
title('�������ͼ��');
