%ͼ����߼����С�
clear all;
I=imread('trees.tif');
subplot(2,3,1);imshow(I);
title('ԭʼͼ��')
J=imdivide(I,2);
K1=bitand(I,J);
subplot(2,3,2);
imshow(K1);
title('λ������')
K2=bitcmp(I,8);              %�ȼ���2^8-I
subplot(2,3,3);
imshow(K2);
title('λ������')
K3=bitor(I,J);
subplot(2,3,4);
imshow(K3);
title('λ������')
K4=bitxor(I,J);
subplot(2,3,5);
imshow(K4);
title('λ�������')
K5=bitshift(I,2);
subplot(2,3,6);
imshow(K5);
title('λ������')
