A=imread('cell.tif');   %读取图像
figure, subplot(1,3,1);
imshow(A) ; 
title('原始图像');
B=histeq(A);   %利用histeq函数对图像进行直方图均衡化
subplot(1,3,2);
imshow(B);
 title('histeq函数作用效果');
C=adapthisteq(A);   %利用adapthisteq函数对图像进行直方图均衡化
subplot(1,3,3);
imshow(C) ; 
title('adapthisteq函数作用效果');
