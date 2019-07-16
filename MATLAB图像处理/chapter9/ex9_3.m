clear
I=imread('glass.png');      			%读取图像
subplot(2,2,1);
imshow(I);
title('原图像');
subplot(2,2,2);
imhist(I);
title('原图像直方图');
subplot(2,2,3);
J=imadjust(I,[],[0.4 0.6]);			%调整图像的灰度到指定范围
imshow(J);
title('调整灰度后的图像');
subplot(2,2,4);
imhist(J);
title('调整灰度后的直方图');
