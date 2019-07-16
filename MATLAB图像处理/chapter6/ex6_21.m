clear all;
[I,map]=imread('trees.tif');
J=imrotate(I,35,'bilinear');
J1=imrotate(I,35,'bilinear','crop');  %采用双线性插值法，图像进行水平旋转
J2=imrotate(I,35,'nearest','crop');  %采用最近邻插值法，图像进行水平旋转
J3=imrotate(I,35,'bicubic','crop');  %采用双立方插值法，图像进行水平旋转
subplot(2,3,1),
imshow(I,map)
title('原始图像')
subplot(2,3,2),
imshow(J,map)
title('双线性插值')
subplot(2,3,3),
imshow(J1,map)  
title('双线性插值')
subplot(2,3,4),
imshow(J2,map)  
title('最近邻插值')
subplot(2,3,5),
imshow(J3,map)  
title('双立方插值')
