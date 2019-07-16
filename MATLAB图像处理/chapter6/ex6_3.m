clear;
%%读入图像
a=imread('pout.tif');
subplot(1,2,1);
imhist(a);
title('原始图像的直方图');
%%b=f(a)
b1=1.24*double(a)+44;
subplot(1,2,2); 
imhist(uint8(b1));
title ('变换后的直方图');
