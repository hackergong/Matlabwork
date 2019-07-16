R=imread('peppers.png');         	%读入图像
R2=imadd(R,100);             	%增加图像的亮度
subplot(1,2,1),
imshow(R);
title('原始图像');
subplot(1,2,2),
imshow(R2);  
title('增亮后的图像');
