clear all;
I = imread('circuit.tif');  
subplot(2,2,1);imshow(I)
title('原始图像')
background = imopen(I,strel('disk',15));
I2 = I - background;
subplot(2,2,2), imshow(I2)
title('去除背景后图像')
I3 = imadjust(I2); %调用图像的灰度值，增加图像的对比度
subplot(2,2,3), imshow(I3);
title('增强对比度')
 [level,EM] = graythresh(I3) %阈值的图像
bw = im2bw(I3,level);
subplot(2,2,4), imshow(bw)
title('自动阈值法')
