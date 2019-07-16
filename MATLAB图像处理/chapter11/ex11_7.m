clear all;
I = imread('eight.tif');
subplot(1,2,1);imshow(I);
title('原始图像');
BW = edge(imrotate(I,50,'crop'),'prewitt');
[H,T,R] = hough(BW);
P = houghpeaks(H,2);    %提取峰值
subplot(1,2,2);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit'); %显示Houhg变换
title('Houhg变换');
xlabel('\theta 轴'), ylabel('\rho 轴');
axis on, axis normal, 
hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');   %标记颜色为白色
