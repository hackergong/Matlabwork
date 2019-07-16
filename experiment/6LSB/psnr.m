close all;
clear all; 
clc;  
img=imread('lena.jpg'); 
[h,w]=size(img); 
imgn=imresize(img,[floor(h/2) floor(w/2)]);
imgn=imresize(imgn,[h w]); 
img=double(img); 
imgn=double(imgn);  
B=8;      %����һ�������ö��ٶ�����λ 
MAX=2^B-1;       %ͼ���ж��ٻҶȼ� 
MSE=sum(sum((img-imgn).^2))/(h*w);     %������ 
PSNR=20*log10(MAX/sqrt(MSE));     %��ֵ����� 
figure;
imshow(imgn,[0,255]);
title(sprintf(' PSNR: %.3f dB ', PSNR));
