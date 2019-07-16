I=imread('cameraman.tif');      	%读取图像
I1=im2col(I,[8 8],'distinct'); 	%用列操作函数实现分离邻域操作
I1=ones(64,1)* mean(I1);
I2=col2im(I1,[8,8],size(I),'distinct');
subplot(121),
imshow(I,[]);
title('原始图像');
subplot(122),
imshow(I2,[]);  
title('列处理分离邻域操作');
