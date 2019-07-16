i=imread('coins.png');
A1=imregionalmin(i);  	%确定所有极小值
A2=imextendedmin (i,45); 	%确定局部极小值
subplot(1,3,1);
imshow(i); 
title('原始图像') ;
subplot(1,3,2);
imshow(A1); 
title('所有极小值')
subplot(1,3,3);
imshow(A2); 
title('局部极小值') ;
