clear all；
%小波变换
[I,map]=imread('lena.tif');
colormap(map);
figure(1);
subplot(2,2,1);
imshow(I);
title('原始图像');
set(get(gca,'title'),'fontname','微软雅黑');

J=rgb2gray(I);
figure(1);
subplot(2,2,2);
imshow(J);
title('灰度图像');
set(get(gca,'title'),'fontname','微软雅黑');

[cA1,cH1,cV1,cD1] = dwt2(J,'bior3.7');   

A1 = upcoef2('a',cA1,'bior3.7',1);         %bior3.7为小波基函数。
H1 = upcoef2('h',cH1,'bior3.7',1);
V1 = upcoef2('v',cV1,'bior3.7',1);  
D1 = upcoef2('d',cD1,'bior3.7',1);

figure(2);
subplot(3,2,1); image(wcodemat(A1,192));    %wcodemat扩展伪彩色矩阵缩 wcodemat(x,NBCODES)
                                            %wcodemat对矩阵进行量化编码，一般最大值取192
title('近似系数 A1');              %将输入X重新标为[1,NBCODES]范围内的整数。NBCODES的默认值是16。
set(get(gca,'title'),'fontname','微软雅黑');%

figure(2);
subplot(3,2,2); 

image(wcodemat(H1,192));    
title('水平细节 H1');
set(get(gca,'title'),'fontname','微软雅黑');

figure(2);
subplot(3,2,3); image(wcodemat(V1,192));
title('垂直细节 V1');
set(get(gca,'title'),'fontname','微软雅黑');

figure(2);
subplot(3,2,4); image(wcodemat(D1,192));
title('对角线细节 D1');
set(get(gca,'title'),'fontname','微软雅黑');


Y1=idwt2(A1,H1,V1,D1,'bior3.7');
figure(2);
subplot(3,2,5);
image(Y1);
title('一重小波重构图像');
set(get(gca,'title'),'fontname','微软雅黑');
