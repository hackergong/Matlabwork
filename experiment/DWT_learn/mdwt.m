clear all;
%%
%预处理 多重小波变换
I=imread('lena.tif');
subplot(2,2,1);
imshow(I);
title('原始图像');
set(get(gca,'title'),'fontname','微软雅黑');

%%
%二维小波变换
J=rgb2gray(I);
 [cA1,cH1,cV1,cD1] = dwt2(J,'bior3.7');    
A1 = upcoef2('a',cA1,'bior3.7',1); 
H1 = upcoef2('h',cH1,'bior3.7',1);
V1 = upcoef2('v',cV1,'bior3.7',1);
D1 = upcoef2('d',cD1,'bior3.7',1);
%% 
%二维小波逆变换
Y=idwt2(A1,H1,V1,D1,'bior3.7');
subplot(2,2,2);image(Y);title('一重小波重构图像');
set(get(gca,'title'),'fontname','微软雅黑');
A2 = upcoef2('a',cA1,'bior3.7',2); 
H2 = upcoef2('h',cH1,'bior3.7',2);
V2 = upcoef2('v',cV1,'bior3.7',2);
D2 = upcoef2('d',cD1,'bior3.7',2);
%%
%二重小波重构图像
Y=idwt2(A2,H2,V2,D2,'bior3.7');
subplot(2,2,3);image(Y);title('二重小波重构图像');
set(get(gca,'title'),'fontname','微软雅黑');
A3 = upcoef2('a',cA1,'bior3.7',3); 
H3 = upcoef2('h',cH1,'bior3.7',3);
V3 = upcoef2('v',cV1,'bior3.7',3);
D3 = upcoef2('d',cD1,'bior3.7',3);
%%
%三重小波重构图像
Y=idwt2(A3,H3,V3,D3,'bior3.7');
subplot(2,2,4);image(Y);title('三重小波重构图像');
set(get(gca,'title'),'fontname','微软雅黑');
