I=imread('tape.png');
subplot(231),
imshow(I);
title('ԭͼ��');
I=rgb2gray(I);
J=imnoise(I,'salt & pepper',0.04);
subplot(232),imshow(J);title('��ӽ�������ͼ��');
k1= wiener2 (J);       	%����3*3ģ����ֵ�˲�
k2= wiener2 (J,[5,5]); 	%����5*5ģ����ֵ�˲�
k3= wiener2 (J,[7,7]); 	%����7*7ģ����ֵ�˲�
k4= wiener2 (J,[9,9]);    	%����9*9ģ����ֵ�˲�
subplot(233),
imshow(k1);
title('3*3ģ����ֵ�˲�');
subplot(234),
imshow(k2);
title('5*5ģ����ֵ�˲� ');
subplot(235),
imshow(k3);
title('7*7ģ����ֵ�˲�');
subplot(236),
imshow(k4);
title('9*9 ģ����ֵ�˲�');
