%读取并显示图像并显示标注矩阵
I= imread('moon.tif'); %原始图像
figure; subplot(131);imshow(I)
BW = I > 0;%二值图像
L = bwlabel(BW);%标注矩阵
subplot(132); 
imshow(label2rgb(L))%彩色显示标注矩阵
%质心和加权质心的计算。
s = regionprops(L, I, {'Centroid','WeightedCentroid'});%求取质心等
subplot(133); 
imshow(I)%显示原图
hold on
numObj = numel(s);
for k = 1 : numObj
    plot(s(k).WeightedCentroid(1), ...
        s(k).WeightedCentroid(2), 'r*');%在原图上显示加权质心
    plot(s(k).Centroid(1), s(k).Centroid(2), 'bo');%在原图上显示质心
end	
hold off
%统计性质的计算，运行结果如图 13 10所示：
s = regionprops(L, I, ...
    {'Centroid','PixelValues','BoundingBox'});%求质心、像素值、范围属性
figure,subplot(131);
imshow(I);%显示原图
hold on
for k = 1 : numObj
    s(k).StandardDeviation = std(double(s(k).PixelValues));%标准差
    text(s(k).Centroid(1),s(k).Centroid(2), ...
        sprintf('%2.1f', s(k).StandardDeviation), ...
        'EdgeColor','b','Color','g');
end
hold off; subplot(132);
bar(1:numObj,[s.StandardDeviation]);%显示标准差
sStd = [s.StandardDeviation];
lowStd = find(sStd < 50);%找出标准差小于50的目标
subplot(133);imshow(I);%显示原图
hold on;
for k = 1 : length(lowStd)
    rectangle('Position', s(lowStd(k)).BoundingBox, ...
        'EdgeColor','y');%矩形标注所选目标
end
hold off;
