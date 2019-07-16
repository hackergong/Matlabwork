I=imread('rice.png');
BW1=edge(I,'Roberts',0.04);   	%RobertsËã×Ó¼ì²â±ßÔµ
subplot(1,2,1),
imshow(I);
title('Ô­Í¼Ïñ')
subplot(1,2,2),
imshow(BW1);
title('RobertsËã×Ó¼ì²â±ßÔµ')
