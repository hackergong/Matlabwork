clear all;
I = imread('pout.tif');
J = imlincomb(1.5,I);
subplot(1,2,1);
imshow(I);
title('ԭʼͼ��')
subplot(1,2,2);
imshow(J)
title('�Ŵ�1.5��ͼ��')
