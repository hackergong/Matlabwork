RGB=imread('onion.png'); 
HSV=rgb2hsv(RGB);        %将HSV模型转换到RGB模型
RGB1=hsv2rgb(HSV);
subplot(1,3,1),
imshow(RGB),
title('RGB图像'); 
subplot(1,3,2),
imshow(HSV),
title('HSV图像'); 
subplot(1,3,3),
imshow(RGB1),
title('还原的图像');
