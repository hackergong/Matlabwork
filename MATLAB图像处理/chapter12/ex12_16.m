I=imread('text.png');   	%读入二值图像
subplot(1,3,1);
imshow(I);
title('原始图像') ;
BW1=im2bw(I);
subplot(1,3,2);
imshow(BW1);
title('二值图像') ;
BW2=imfill(BW1,'holes');  	%执行填洞运算
subplot(1,3,3);
imshow(BW2);
title('填充图像') ;
