clear all;
I2=imread('eight.tif');
subplot(2,3,1);imshow(I2);
title('原始图像')
Z1=interp2(double(I2),2,'nearest');    %最近邻插值法
Z1=uint8(Z1);
subplot(2,3,2);
imshow(Z1);
title('最近邻插值');
Z2=interp2(double(I2),2,'linear');     %线性插值法
Z2=uint8(Z2);
subplot(2,3,3);
imshow(Z2);
title('线性插值法');
Z3=interp2(double(I2),2,'spline');   %三次样条插值法
Z3=uint8(Z3);
subplot(2,3,4);
imshow(Z3);
title('三次样条插值');
Z4=interp2(double(I2),2,'cubic');    %立方插值
Z4=uint8(Z4);
subplot(2,3,5);
imshow(Z4);
title('立方插值');
