I=imread('peppers.png');   	%读取图像
figure;
subplot(2,2,1);
imshow(I);
title('原始图像');
I=rgb2gray(I);
subplot(2,2,2);
imhist(I);
title('原始图像直方图');
I1=histeq(I);     	%图像均衡化
subplot(2,2,3);
imshow(I1);
title('图像均衡化');
subplot(2,2,4);
imhist(I1);
title('直方图均衡化');
