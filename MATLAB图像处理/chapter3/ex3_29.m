[I,map]=imread('forest.tif');
X=ind2rgb(I,map);          %将索引图像转换为RGB图像
subplot(1,2,1);
imshow(I,map);
title('原始图像');
subplot(1,2,2);
imshow(X);
title('RGB图像');
