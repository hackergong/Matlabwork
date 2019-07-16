clear all;
I = imread('blobs.png');
subplot(1,3,1);imshow(I);
title('原始图像');
rotI = imrotate(I,45,'crop');       %图像旋转
BW = edge(rotI,'sobel');             %用sobel算子提取图像中的边缘
[H,T,R] = hough(BW);                 %对图像进行Hough变换
subplot(1,3,2);
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
title('hough变换');
xlabel('\theta 轴'), ylabel('\rho 轴');
axis on, axis normal,
hold on;
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));  %寻找极值点
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7); % 找出对应的直线边缘
subplot(1,3,3);imshow(rotI), title('检测线段');
hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % 标记直线边缘对应的起点
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','blue');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
      len = norm(lines(k).point1 - lines(k).point2); % 计算直线边缘长度
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','b'); 
