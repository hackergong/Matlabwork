clc                                 
I=imread('lena.tif');
figure,imshow(I);
title('srcImage');
I1=myimrotate(I,30);     %����myimrotate()������ת30�� 
I2=myimrotate(I,-90);     %����myimrotate()������ת-90��
figure,imshow(uint8(I1));
title('��ת30�㣺I1');
set
figure,imshow(uint8(I2));
title('��ת-90�㣺I2');