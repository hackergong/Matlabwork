clear all;
I=imread('tire.tif');
[X,map]=gray2ind(I,32);       %灰度图像转换成索引图像
subplot(1,2,1),
imshow(I);
title('原始图像');
subplot(1,2,2),
imshow(X,map);
title('索引图像');
