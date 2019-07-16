i=imread('text.png'); 	%读取图像
se=strel('line',11,90);
bw=imerode(i,se);    	%进行腐蚀处理
subplot(1,2,1);
imshow(i); 
title('原始图像') ;
subplot(1,2,2);
imshow(bw); 
title('二值图像腐蚀处理后') ;
