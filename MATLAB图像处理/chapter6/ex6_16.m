clear
R=imread('peppers.png');       	%����ͼ��
R2=imsubtract(R,100);        	%����Rͼ�������
subplot(1,2,1),
imshow(R); 
title('ԭʼͼ��');
subplot(1,2,2),
imshow(R2);
 title('���ͺ��ͼ��');
