I=imread('coins.png');  
A=imnoise(I,'salt & pepper', 0.02);
subplot(2,2,1);
imshow(A);
title('添加椒盐噪声图像')
h=fspecial('gaussian',10,5);  	%产生高斯滤波器
A1=imfilter(A,h);    	%对图像进行滤波
subplot(2,2,2);
imshow(A1)  
title('滤波处理')
level=graythresh(A1);  	%获取适当的二值化阈值
BW=im2bw(A1,level);  	%图像二值化
subplot(2,2,3);
imshow(BW) 
title('二值化')
BW1=bwmorph(A,'skel',Inf);	%骨架提取
subplot(2,2,4);
imshow(BW1) 
title('骨架提取')
