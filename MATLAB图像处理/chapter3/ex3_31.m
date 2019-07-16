RGB=imread('onion.png'); 
[X,MAP]=rgb2ind(RGB,0.7);        %将真彩色图像转换成索引色图像
subplot(1,2,1);
imshow(RGB);
title('原始图像');
subplot(1,2,2);
imshow(X,MAP);
title('索引图像');
