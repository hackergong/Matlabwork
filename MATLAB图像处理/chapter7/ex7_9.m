Y=imread('onion.png');
subplot(131),
imshow(Y)
title('原始图像');
I= rgb2gray(Y);	%转换为灰度图像
J=dct2(I);
K=idct2(J);
subplot(132),
imshow(K,[0 255])
title('灰度图像');
J(abs(J)<9)=0; 	%舍弃系数
K2=idct2(J);
subplot(133),
imshow(K2,[0 255])
title('重构图像');
