I=imread('pout.tif');
BW1=edge(I,'log',0.003,2);         	%sigma=2
subplot(1,3,1);
imshow(I);
title('原图像')
subplot(1,3,2);
imshow(BW1);
title(' sigma =2的LOG算子检测的边缘')
BW1=edge(I,'log',0.003,3);       	% sigma=3
subplot(1,3,3);
imshow(BW1);
title(' sigma =3的LOG算子检测的边缘')
