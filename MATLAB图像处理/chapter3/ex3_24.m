I=imread('peppers.png');
X=im2bw(I,0.5);         %�����ɫת��Ϊ��ֵͼ��
subplot(1,2,1),
imshow(I);
title('ԭʼͼ��');
subplot(1,2,2),
imshow(X);
title('��ֵͼ��');
