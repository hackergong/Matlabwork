i=imread('tire.tif');    	%读取图像
A=imhmin (i,45);    	%利用imhmin函数对图像进行处理
subplot(1,2,1);
imshow(i); 
title('原始图像') ;
subplot(1,2,2);
imshow(A); 
title('抑制极小值') ;
