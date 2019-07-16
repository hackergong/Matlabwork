I=imread('tire.tif');  	%读取图像
subplot(2,2,1),
imshow(I);
title('原始图像')
hgram=50:2:250;  	%规定化函数
J=histeq(I,hgram);
subplot(2,2,2),
imshow(J);
title('图像的规定化')
subplot(2,2,3),
imhist(I,64);
title('原始图像直方图')
subplot(2,2,4),
imhist(J,64);
title('规定化后直方图')
