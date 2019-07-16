J=imread('breast.png')
figure,
subplot(121);
imshow(J);
title('原始图像');
J=double(J);
lapMatrix=[1 1 1;1 -8 1;1 1 1];       	%拉普拉斯模板
J_tmp=imfilter(J,lapMatrix,'replicate'); 	%滤波
I=imsubtract(J,J_tmp);          	%图像相减
subplot(122);
imshow(I),
title('锐化图像');
