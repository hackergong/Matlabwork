I=imread('peppers.png');   	%��ȡͼ��
figure;
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');
I=rgb2gray(I);
subplot(2,2,2);
imhist(I);
title('ԭʼͼ��ֱ��ͼ');
I1=histeq(I);     	%ͼ����⻯
subplot(2,2,3);
imshow(I1);
title('ͼ����⻯');
subplot(2,2,4);
imhist(I1);
title('ֱ��ͼ���⻯');
