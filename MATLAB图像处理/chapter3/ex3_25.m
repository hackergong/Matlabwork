I=imread('tire.tif');
A=filter2(fspecial('sobel'),I);
J=mat2gray(A);          %�����ݾ���ת��Ϊ�Ҷ�ͼ��
subplot(1,2,1);
subimage(A);
title('ԭʼͼ��');
subplot(1,2,2);
subimage(J);
title('ת��Ϊ�Ҷ�ͼ��');
