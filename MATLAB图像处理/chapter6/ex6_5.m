A=imread('cell.tif');   %��ȡͼ��
figure, subplot(1,3,1);
imshow(A) ; 
title('ԭʼͼ��');
B=histeq(A);   %����histeq������ͼ�����ֱ��ͼ���⻯
subplot(1,3,2);
imshow(B);
 title('histeq��������Ч��');
C=adapthisteq(A);   %����adapthisteq������ͼ�����ֱ��ͼ���⻯
subplot(1,3,3);
imshow(C) ; 
title('adapthisteq��������Ч��');
