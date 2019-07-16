clc
close all
clear
I=imread('cell.tif');
X2=grayslice(I,8);            %将灰度图像转换为索引图像
subplot(1,2,1);
subimage(I);
title('原始图像');
subplot(1,2,2);
subimage(X2,jet(8));
title('索引图像');
