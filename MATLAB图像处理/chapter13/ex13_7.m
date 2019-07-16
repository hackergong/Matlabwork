%对图像进行读取，并将其转化为二值图像。
RGB = imread('pears.png');%读取图像
figure; subplot(221);imshow(RGB);%显示
title('原始图像');
I = rgb2gray(RGB);%转化为灰度图像
threshold = graythresh(I);%阈值
bw = im2bw(I,threshold);%转化为二值图像
subplot(222);imshow(bw)%显示二值图像
title('二值图像');
%对图像中的目标的边界进行寻找。
bw = bwareaopen(bw,30);%去除小目标
se = strel('disk',2);%圆形结构元素
bw = imclose(bw,se);%关操作
bw = imfill(bw,'holes');%填充孔洞
subplot(223); imshow(bw)%显示填充孔洞后的图像
title('除噪后的图像');
 [B,L] = bwboundaries(bw,'noholes');%图像边界
subplot(224);imshow(label2rgb(L, @jet, [.5 .5 .5]))%不同颜色显示
title('圆形目标的确定');
hold on
for k = 1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1), 'w', 'LineWidth', 2)%显示白色边界
end
%对图像中圆形目标的确定。
stats = regionprops(L,'Area','Centroid');%求取面积、质心等
threshold = 0.94;%阈值
for k = 1:length(B)
  boundary = B{k};
  delta_sq = diff(boundary).^2;
  perimeter = sum(sqrt(sum(delta_sq,2)));%求取周长
  area = stats(k).Area;%面积
  metric = 4*pi*area/perimeter^2;%圆形的量度
  metric_string = sprintf('%2.2f',metric);
  if metric > threshold
    centroid = stats(k).Centroid;
    plot(centroid(1),centroid(2),'ko');%标记圆心
  end
  text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color',...
      'y', 'FontSize',14,'FontWeight','bold');%标注圆形度量
End
