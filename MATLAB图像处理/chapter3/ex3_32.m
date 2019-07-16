RGB=imread('greens.jpg'); 
HSV=rgb2hsv(RGB);        %将RGB模型转换到HSV模型
subplot(1,2,1),
imshow(RGB),
title('RGB图像'); 
subplot(1,2,2),
imshow(HSV),
title('HSV图像');
