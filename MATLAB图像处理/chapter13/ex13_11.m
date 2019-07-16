%对图像进行读取，并选择出将要测量角度的区域。
RGB = imread('tape.png');%读取图像
subplot(221);imshow(RGB);%显示
title('原始图像');
line([300 328],[85 103],'color',[1 1 0]);%画直线
line([268 255],[85 140],'color',[1 1 0]);%画直线
start_row = 34;%选取图像的起始行
start_col = 208;%选取图像的其实列
cropRGB = RGB(start_row:163, start_col:400, :);%确定图像区域
subplot(222);imshow(cropRGB)%显示
title('子区域');

%对角的直线边界进行读取。
offsetX = start_col-1;%x方向的偏移量
offsetY = start_row-1;%y方向的偏移量
I = rgb2gray(cropRGB);%转化为灰度图像
threshold = graythresh(I);%阈值
BW = im2bw(I,threshold);%转化为二值图像
BW = ~BW;%取反
subplot(223);imshow(BW)%显示二值图像
title('二值子图像');

dim = size(BW);%图像大小
col1 = 4;%水平轴的起始列
row1 = min(find(BW(:,col1)));%水平轴的起始行
row2 = 12;%另一直线的其实行
col2 = min(find(BW(row2,:)));%另一直线的起始列
boundary1 = bwtraceboundary(BW, [row1, col1], 'N', 8, 70);%水平边界
boundary2 = bwtraceboundary(BW, [row2, col2], 'E', 8, 90,...
    'counter');%另一直线的边界
subplot(224);imshow(RGB); %显示原图像
title('求取的边界角度');
hold on;
plot(offsetX+boundary1(:,2),offsetY+boundary1(:,1),'g',...
    'LineWidth',2);%显示水平方向的直线
plot(offsetX+boundary2(:,2),offsetY+boundary2(:,1),'g',...
    'LineWidth',2);%显示另一方向的直线
%角度的计算。
ab1 = polyfit(boundary1(:,2), boundary1(:,1), 1);%拟合直线
ab2 = polyfit(boundary2(:,2), boundary2(:,1), 1);%拟合直线
vect1 = [1 ab1(1)];  vect2 = [1 ab2(1)];
dp = dot(vect1, vect2);%点积
length1 = sqrt(sum(vect1.^2));%长度
length2 = sqrt(sum(vect2.^2));%长度
angle = 180-acos(dp/(length1*length2))*180/pi%计算角度
intersection = [1 ,-ab1(1); 1,-ab2(1)] \ [ab1(2); ab2(2)];%相对位置
intersection = intersection + [offsetY; offsetX]%交点实际坐标
inter_x = intersection(2);%交点的x轴坐标
inter_y = intersection(1);%交点的y轴坐标
plot(inter_x,inter_y,'yx','LineWidth',2);%在原图上标注交点
