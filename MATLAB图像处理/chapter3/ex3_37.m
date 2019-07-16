clear
RGB=imread('peppers.png');
YCbCr=rgb2ycbcr(RGB);         	%将YCbCr模型转换到RGB模型
subplot(1,3,1);
subimage(RGB);
title('原图像');
subplot(1,3,2);
subimage(YCbCr);
title('变换后的图像');
RGB2=ycbcr2rgb(YCbCr);
subplot(1,3,3);
subimage(RGB2);
title('还原的图像');
