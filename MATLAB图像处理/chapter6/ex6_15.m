clear all;
coins=imread('coins.png');
background=imopen(coins,strel('disk',15));
coins1=imsubtract(coins,background);
subplot(2,2,1),
imshow(coins);
title ('原始图像')
subplot(2,2,2);
imshow(background);
title ('背景图像')
subplot(2,2,3),
imshow(coins1);  
title ('imsubtract函数相减结果')
K = imabsdiff(coins,background);
subplot(2,2,4);
imshow(K,[])
title ('imabsdiff函数相减结果')
