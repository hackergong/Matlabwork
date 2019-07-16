clear all;
%%
%Ԥ���� ����С���任
I=imread('lena.tif');
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');
set(get(gca,'title'),'fontname','΢���ź�');

%%
%��άС���任
J=rgb2gray(I);
 [cA1,cH1,cV1,cD1] = dwt2(J,'bior3.7');    
A1 = upcoef2('a',cA1,'bior3.7',1); 
H1 = upcoef2('h',cH1,'bior3.7',1);
V1 = upcoef2('v',cV1,'bior3.7',1);
D1 = upcoef2('d',cD1,'bior3.7',1);
%% 
%��άС����任
Y=idwt2(A1,H1,V1,D1,'bior3.7');
subplot(2,2,2);image(Y);title('һ��С���ع�ͼ��');
set(get(gca,'title'),'fontname','΢���ź�');
A2 = upcoef2('a',cA1,'bior3.7',2); 
H2 = upcoef2('h',cH1,'bior3.7',2);
V2 = upcoef2('v',cV1,'bior3.7',2);
D2 = upcoef2('d',cD1,'bior3.7',2);
%%
%����С���ع�ͼ��
Y=idwt2(A2,H2,V2,D2,'bior3.7');
subplot(2,2,3);image(Y);title('����С���ع�ͼ��');
set(get(gca,'title'),'fontname','΢���ź�');
A3 = upcoef2('a',cA1,'bior3.7',3); 
H3 = upcoef2('h',cH1,'bior3.7',3);
V3 = upcoef2('v',cV1,'bior3.7',3);
D3 = upcoef2('d',cD1,'bior3.7',3);
%%
%����С���ع�ͼ��
Y=idwt2(A3,H3,V3,D3,'bior3.7');
subplot(2,2,4);image(Y);title('����С���ع�ͼ��');
set(get(gca,'title'),'fontname','΢���ź�');
