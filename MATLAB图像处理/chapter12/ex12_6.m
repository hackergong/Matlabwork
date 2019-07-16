i=imread('circles.png'); 	%读取图像
subplot(1,2,1);
imshow(i); 
title('原始图像') ;
se=strel('disk',7);
i0=imopen(i,se);
subplot(1,2,2);
imshow(i0);        	%开运算
title('开运算') ;
