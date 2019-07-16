I = imread('aa.png');
I=rgb2gray(I);
J = histeq(I);          	%图像的均衡化
subplot(221);
imshow(I);
title('原始图像')
subplot(222);
imshow(J);
title('均衡化图像')
subplot(223);
imhist(I,64)
title('原始图像直方图')
subplot(224);
imhist(J,64)
title('均衡化直方图')
