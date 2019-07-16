clear all;
I=imread('peppers.png');
map=pink(512);
X=dither(I,map);   %将RGB图像抖动成索引图像
subplot(1,2,1),
imshow(I);
title('原始图像');
subplot(1,2,2),
imshow(X,map);  
title('抖动成索引图像');
