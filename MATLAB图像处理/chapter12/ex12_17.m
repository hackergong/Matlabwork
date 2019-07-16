bw= imread('circbw.tif');
bw2=bwareaopen(bw,50);    	%从图像中移除小目标
subplot(1,2,1);
imshow(bw); 
title('原始图像') ;
subplot(1,2,2);
imshow(bw2); 
title('移除小目标') ;
