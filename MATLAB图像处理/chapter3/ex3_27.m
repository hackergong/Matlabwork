clc
close all
clear
I=imread('cell.tif');
X2=grayslice(I,8);            %���Ҷ�ͼ��ת��Ϊ����ͼ��
subplot(1,2,1);
subimage(I);
title('ԭʼͼ��');
subplot(1,2,2);
subimage(X2,jet(8));
title('����ͼ��');
