load trees
subplot(1,2,1);
imshow(X,map);
I=ind2gray(X,map)          %将索引图像转换为灰度图像
title('原始图像');
subplot(1,2,2);
imshow(I);
title('灰度图像');
