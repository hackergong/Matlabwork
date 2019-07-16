clear all
close all
I=imread('rice.png');
figure, subplot(1,3,1);
imshow(I),title('原始图像')
subplot(1,3,2);
imhist(I),title('直方图')   % 观察灰度直方图
I1=im2bw(I,120/255); % im2bw 函数需要将灰度值转换到[0,1]范围内
subplot(1,3,3);
imshow(I1),title('直方图阈值法分割结果')
