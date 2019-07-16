close all;
clear all; 
clc;  
img=imread('lena.jpg'); 
[h,w]=size(img); 
imgn=imresize(img,[floor(h/2) floor(w/2)]);
imgn=imresize(imgn,[h w]); 
img=double(img); 
imgn=double(imgn);  
B=8;      %编码一个像素用多少二进制位 
MAX=2^B-1;       %图像有多少灰度级 
MSE=sum(sum((img-imgn).^2))/(h*w);     %均方差 
PSNR=20*log10(MAX/sqrt(MSE));     %峰值信噪比 
figure;
imshow(imgn,[0,255]);
title(sprintf(' PSNR: %.3f dB ', PSNR));
