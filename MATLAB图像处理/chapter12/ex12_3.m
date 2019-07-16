i=imread('eight.tif'); 	%读取图像
se=strel('ball',5,5);
i2=imdilate(i,se);  	%进行膨胀处理
subplot(1,2,1);
imshow(i); 
title('原始图像') ;
subplot(1,2,2);
imshow(i2); 
title('膨胀处理后的图像')
