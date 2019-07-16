clear all
I = imread('blobs.png');
figure(1)
subplot(1,2,1);
imshow(I),title('原始图像')
B = bwboundaries(I); %提取边界
D= B{1,1};
subplot(1,2,2);
plot(D(:,2),D(:,1)) %画第一条边界
set(gca,'YDir','reverse') %翻转y 坐标轴
title('边界标记后图像')
