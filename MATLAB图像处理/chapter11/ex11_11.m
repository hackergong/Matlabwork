clear all
I = imread('tape.png');                 %导入图像
figure(1),
subplot(1,3,1);
imshow(I),title('原始图像')
BW = im2bw(I, graythresh(I));           %生成二值图像
subplot(1,3,2);
imshow(BW),title('二值图像')
 [B,L] = bwboundaries(BW,'noholes'); %提取边界，并返回边界元胞数组B 和区域标志数组L
subplot(1,3,3);
imshow(label2rgb(L, @jet, [.5 .5 .5]))  %以不同的颜色标志不同的区域
title('彩色标记图像')
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)   %在图像上叠画边界
end
