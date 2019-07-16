clear
i=imread('tire.tif');  	%读取图像
fun=@(x)median(x(:));
b=nlfilter(i,[3 3],fun);	%使用滑动邻域操作对图像进行处理
subplot(1,2,1);
imshow(i);
title('原始图像')
subplot(1,2,2);
imshow(b);
title('滑动处理后的图像')
