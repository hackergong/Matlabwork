I=imread('peppers.png');
subplot(231)
imshow(I)
title('ԭʼͼ��')
I=rgb2gray(I);
I1=imnoise(I,'salt & pepper',0.02);
subplot(232)
imshow(I1)
title('��ӽ���������ͼ��')
k1=filter2(fspecial('average',3),I1)/255;   	%����3*3ģ��ƽ���˲�
k2=filter2(fspecial('average',5),I1)/255;   	%����5*5ģ��ƽ���˲�
k4=filter2(fspecial('average',9),I1)/255;   	%����9*9ģ��ƽ���˲�
k3=filter2(fspecial('average',7),I1)/255;   	%����7*7ģ��ƽ���˲�
subplot(233),
imshow(k1);
title('3*3ģ��ƽ���˲�');
subplot(234),
imshow(k2);
title('5*5ģ��ƽ���˲�');
subplot(235),
imshow(k3);
title('7*7ģ��ƽ���˲�');
subplot(236),
imshow(k4);
title('9*9ģ��ƽ���˲�');
