clear all;
I=imread('peppers.png');
map=pink(512);
X=dither(I,map);   %��RGBͼ�񶶶�������ͼ��
subplot(1,2,1),
imshow(I);
title('ԭʼͼ��');
subplot(1,2,2),
imshow(X,map);  
title('����������ͼ��');
