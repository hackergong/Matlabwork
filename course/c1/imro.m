clc                                 
I=imread('lena.tif');
figure,imshow(I);
title('srcImage');
I1=myimrotate(I,30);     %调用myimrotate()函数旋转30° 
I2=myimrotate(I,-90);     %调用myimrotate()函数旋转-90°
figure,imshow(uint8(I1));
title('旋转30°：I1');
set
figure,imshow(uint8(I2));
title('旋转-90°：I2');