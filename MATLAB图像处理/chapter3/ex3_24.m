I=imread('peppers.png');
X=im2bw(I,0.5);         %将真彩色转换为二值图像
subplot(1,2,1),
imshow(I);
title('原始图像');
subplot(1,2,2),
imshow(X);
title('二值图像');
