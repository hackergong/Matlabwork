clear all;
I=imread('tire.tif');
[X,map]=gray2ind(I,32);       %�Ҷ�ͼ��ת��������ͼ��
subplot(1,2,1),
imshow(I);
title('ԭʼͼ��');
subplot(1,2,2),
imshow(X,map);
title('����ͼ��');
