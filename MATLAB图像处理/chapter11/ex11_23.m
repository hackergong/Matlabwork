clear all;
I=imread('cell.tif');
subplot(2,2,1);imshow(I);
title('原始图像');
I2=uint8(colfilt(I,[5,5],'sliding',@mean));        %对图像进行滑动平均处理
subplot(2,2,2);imshow(I2);
title('滑动平均值');
I3=uint8(colfilt(I,[5,5],'sliding',@max));        %对图像进行滑动最大值处理
subplot(2,2,3);imshow(I3);
title('滑动最大值');
I4=uint8(colfilt(I,[5,5],'sliding',@min));        %对图像进行滑动最小值处理
subplot(2,2,4);imshow(I4);
title('滑动最小值');
