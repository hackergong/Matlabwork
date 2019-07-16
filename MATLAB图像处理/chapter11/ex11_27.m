I=imread('tire.tif');   	%读取图像
f=inline('ones(64,1)* mean(x)');	%对图像进行快速分离邻域操作
I2=colfilt(I,[8 8],'distinct',f);
subplot(1,2,1),
imshow(I,[])
title('原始图像');
subplot(1,2,2),
imshow(I2,[])  
title('快速分离邻域操作');
