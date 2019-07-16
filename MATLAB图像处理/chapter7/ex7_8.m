RGB=imread('tape.png');
subplot(131),
imshow(RGB);
title('原始图像');
I=rgb2gray(RGB);   	%转换为灰度图像
subplot(132),
imshow(I);
title('灰度图像');
J=dct2(I);            	%使用dct2对图像进行DCT变换
subplot(133),
imshow(log(abs(J)),[]),colormap(jet(64));
title('DCT变换');
