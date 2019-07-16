I=imread('tire.tif');
A=filter2(fspecial('sobel'),I);
J=mat2gray(A);          %将数据矩阵转换为灰度图像
subplot(1,2,1);
subimage(A);
title('原始图像');
subplot(1,2,2);
subimage(J);
title('转换为灰度图像');
