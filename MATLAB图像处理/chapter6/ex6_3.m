clear;
%%����ͼ��
a=imread('pout.tif');
subplot(1,2,1);
imhist(a);
title('ԭʼͼ���ֱ��ͼ');
%%b=f(a)
b1=1.24*double(a)+44;
subplot(1,2,2); 
imhist(uint8(b1));
title ('�任���ֱ��ͼ');
