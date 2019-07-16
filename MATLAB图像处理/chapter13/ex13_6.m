M=imread('aa.png');   	%提取图像
I=rgb2gray(M); 
BW1=edge(I,'sobel');     	%用Sobel算子进行边缘检测
BW2=edge(I,'roberts');  	%用Roberts算子进行边缘检测
BW3=edge(I,'prewitt'); 	%用prewitt算子进行边缘检测
BW4=edge(I,'log');    	%用log算子进行边缘检测
BW5=edge(I,'canny');  	%用canny算子进行边缘检测
h=fspecial('gaussian',5); 	%高斯低通滤波器 
BW6=edge(I,'canny');   	%滤波之后的canny检测
subplot(2,3,1), 
imshow(BW1);
title('sobel 边缘检测');
subplot(2,3,2), 
imshow(BW2);
title('Roberts 边缘检测');
subplot(2,3,3), 
imshow(BW3);
title('prewitt 边缘检测');
subplot(2,3,4), 
imshow(BW4);
title('log 边缘检测');
subplot(2,3,5),
imshow(BW5);
title('canny 边缘检测');
subplot(2,3,6), 
imshow(BW6);
title('gasussian&canny 边缘检测');
