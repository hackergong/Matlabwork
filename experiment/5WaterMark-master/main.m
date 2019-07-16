
importimage;

% 密钥1，Arnold置乱次数
ntimes = 25;

% 密钥2，随机数种子
rngseed = 59433;

% 是否显示中间图像
flag = 1;

% 水印嵌入
[Uw,psnr] = setdwtwatermark(U,W,ntimes,rngseed,flag);

K = YUV; K(:,:,2) = Uw;
figure;
K = ycbcr2rgb(K);
imshow(K);
title('水印嵌入后图像')
set(get(gca,'title'),'fontname','微软雅黑');


[Wg,nc,idx] = getdwtwatermark(Uw,W,ntimes,rngseed,flag);