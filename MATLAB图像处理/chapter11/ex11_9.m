clc
clear all
RGB = imread('saturn.png');     
figure
subplot(1,3,1);
imshow(RGB);
title('原始图像')
I = rgb2gray(RGB);            
threshold = graythresh(I);     
BW = im2bw(I,threshold);        %将灰度图像转换为二值图像
subplot(1,3,2);
imshow(BW)
title('二值图像')
dim = size(BW);
col = round(dim(2)/2)-90;       %计算起始点列坐标
row = find(BW(:,col), 1);       %计算起始点行坐标
connectivity = 8;
num_points = 180;
contour = bwtraceboundary(BW, [row, col], 'N', connectivity, num_points);     %提取边界
subplot(1,3,3);
imshow(RGB);
hold on;
plot(contour(:,2),contour(:,1),'g','LineWidth',2);
title('结果图像')
