clear all;
I = imread('eight.tif');       %读取灰度图像
subplot(1,3,1), 
imshow(I)
title('原始图像')
[m,n]=size(I);                %图像尺寸
In=imnoise(I,'speckle',0.05);    %添加噪声
subplot(1,3,2), 
imshow(In)
title('添加噪声')
J = dct2(In);
X=zeros(m,n);
X(1:m/3,1:n/3)=1;        
Ydct=J.*X;
J1=uint8(idct2(Ydct));  %逆DCT变换
subplot(1,3,3), 
imshow(J1)
title('DCT处理后图像')
