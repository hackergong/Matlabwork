I=imread('rice.png');              	%读取图像
subplot(121),
imshow(I);
title('原始图像')
level=graythresh(I);
BW=im2bw(I,level);         	%最大类间方差法分割图像
subplot(122),
imshow(BW)
title('自动阈值法分割图像')
disp(strcat('graythresh 计算灰度阈值：',num2str(uint8(level*255))))
