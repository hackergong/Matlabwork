I=imread('peppers.png');
subplot(231)
imshow(I)
title('原始图像')
I=rgb2gray(I);
I1=imnoise(I,'salt & pepper',0.02);
subplot(232)
imshow(I1)
title('添加椒盐噪声的图像')
k1=filter2(fspecial('average',3),I1)/255;   	%进行3*3模板平滑滤波
k2=filter2(fspecial('average',5),I1)/255;   	%进行5*5模板平滑滤波
k4=filter2(fspecial('average',9),I1)/255;   	%进行9*9模板平滑滤波
k3=filter2(fspecial('average',7),I1)/255;   	%进行7*7模板平滑滤波
subplot(233),
imshow(k1);
title('3*3模板平滑滤波');
subplot(234),
imshow(k2);
title('5*5模板平滑滤波');
subplot(235),
imshow(k3);
title('7*7模板平滑滤波');
subplot(236),
imshow(k4);
title('9*9模板平滑滤波');
