clear all;
I=checkerboard(40);           %����һ������
F=fft2(I);
subplot(1,2,1);
imshow(I);
title('ԭʼͼ��');
subplot(1,2,2);
imshow(F);
title('��ά����Ҷ�任')
