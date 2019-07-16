RGB=imread('onion.png');
X=rgb2gray(RGB);           %将一幅真彩色图像转换成灰度图像
subplot(1,2,1);
imshow(RGB);
title('原始图像');
subplot(1,2,2);
imshow(X); 
title('灰度图像');
