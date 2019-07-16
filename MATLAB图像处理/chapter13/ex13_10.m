RGB = imread('peppers.png');%读取图像
figure; subplot(131);imshow(RGB);%显示
title('原始图像');
I = rgb2gray(RGB);%转化为灰度图像
threshold = graythresh(I);%阈值
BW = im2bw(I,threshold);%转化为二值图像
subplot(132);imshow(BW)%显示二值图像
title('二值图像');

%图像边界的获取。
dim = size(BW);%图像大小
col = round(dim(2)/2)-90;%边界起始点的列
row = find(BW(:,col), 1);%边界起始点的行
connectivity = 8;%连通性为8
num_points   = 180;%边界点的个数
contour = bwtraceboundary(BW, [row, col], 'N',...
    connectivity, num_points);%求取圆周
subplot(133);imshow(RGB);%显示原图像
title('测量结果');
hold on;
plot(contour(:,2),contour(:,1),'g','LineWidth',2);%显示绿色边界

%半径的计算。
x = contour(:,2); y = contour(:,1);
abc = [x y ones(length(x),1)] \ -(x.^2+y.^2);%计算参数
a = abc(1); b = abc(2); c = abc(3);
xc = -a/2;%圆心的x轴坐标
yc = -b/2;%圆心的y轴坐标
radius  =  sqrt((xc^2+yc^2)-c)%半径
plot(xc,yc,'yx','LineWidth',2);%标出圆心
theta = 0:0.01:2*pi;
Xfit = radius*cos(theta) + xc;
Yfit = radius*sin(theta) + yc;
plot(Xfit, Yfit);%用蓝色显示另一段弧
message = sprintf('半径的估计值是%2.3f 像素', ...
    radius);
text(15,15,message,'Color','y','FontWeight','bold');
