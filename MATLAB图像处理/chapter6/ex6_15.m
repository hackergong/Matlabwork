clear all;
coins=imread('coins.png');
background=imopen(coins,strel('disk',15));
coins1=imsubtract(coins,background);
subplot(2,2,1),
imshow(coins);
title ('ԭʼͼ��')
subplot(2,2,2);
imshow(background);
title ('����ͼ��')
subplot(2,2,3),
imshow(coins1);  
title ('imsubtract����������')
K = imabsdiff(coins,background);
subplot(2,2,4);
imshow(K,[])
title ('imabsdiff����������')
