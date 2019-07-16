clc
clear
f=imread('breast.tif');  %%%读入图像
subplot(2,2,1);                  %%%在同一个窗口中显示多副图像
imshow(f),title('原始图像')
g1=imadjust(f,[0 1],[1 0]); %将原始图像灰度反转
subplot(2,2,2);
imshow(g1),title('灰度反转')
g2=imadjust(f,[0.6 0.8],[0 1]); %%%将原始图像0.6至0.8之间的灰度级扩展到[0 1]
subplot(2,2,3);
imshow(g2),title('部分区域灰度变换')
%%%将gamma值设置为2
g3=imadjust(f,[ ],[ ],2);
subplot(2,2,4);
imshow(g3),title('gamma=2 ')
