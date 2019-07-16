clear
R=imread('peppers.png');       	%读入图像
R2=imsubtract(R,100);        	%降低R图像的亮度
subplot(1,2,1),
imshow(R); 
title('原始图像');
subplot(1,2,2),
imshow(R2);
 title('降低后的图像');
