clear all;
I=imread('coins.png');
BW=dither(I);      %���Ҷ�ͼ�񶶶��ɶ�ֵͼ��
subplot(1,2,1),
imshow(I);
title('ԭʼͼ��');
subplot(1,2,2),
imshow(BW);
title('�����ɶ�ֵͼ��');
