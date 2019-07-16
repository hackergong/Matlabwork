
% 读取载体图像
I = imread('lenna_RGB.jpg');
I = imresize(I,[540,960]);

% 转换为灰度图
YUV = rgb2ycbcr(I);
Y = YUV(:,:,1); U = YUV(:,:,2); V = YUV(:,:,3);


% 读取水印图像
W = imread('logo3.tif');

% 转换为二值图
 level = graythresh(W);
 W = im2bw(W,0.5);

% 裁剪为长宽相等
W = imresize(W,[150,150]);

subplot(221)
imshow(I);
title('载体图像');
set(get(gca,'title'),'fontname','微软雅黑');

subplot(222)
imshow(W);
title('水印图像');
set(get(gca,'title'),'fontname','微软雅黑');
