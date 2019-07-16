clear
RGB=imread('onion.png');         	%读入图像
YCbCr=rgb2ycbcr(RGB);         	%将RGB模型转换到YCbCr模型
subplot(1,2,1);
subimage(RGB);
title('原图像');
subplot(1,2,2);
subimage(YCbCr);
title('变换后的图像');
