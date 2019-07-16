I=imread('cell.tif');  	%读取图像
I1=im2col(I,[3 3],'sliding');  	%列操作对图像实现滑动
I1=uint8([0 -1 0 -1 4 -1 0 -1 0]*double(I1));
I2=col2im(I1,[3,3],size(I),'sliding');
subplot(121),
imshow(I,[]);
title('原始图像');
subplot(122),
imshow(I2,[]);  
title('滑动处理后的图像')
