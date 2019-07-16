clear all;
I=imread('coins.png');
BW=dither(I);      %将灰度图像抖动成二值图像
subplot(1,2,1),
imshow(I);
title('原始图像');
subplot(1,2,2),
imshow(BW);
title('抖动成二值图像');
