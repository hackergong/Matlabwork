clear all;
I2=imread('eight.tif');
subplot(2,3,1);imshow(I2);
title('ԭʼͼ��')
Z1=interp2(double(I2),2,'nearest');    %����ڲ�ֵ��
Z1=uint8(Z1);
subplot(2,3,2);
imshow(Z1);
title('����ڲ�ֵ');
Z2=interp2(double(I2),2,'linear');     %���Բ�ֵ��
Z2=uint8(Z2);
subplot(2,3,3);
imshow(Z2);
title('���Բ�ֵ��');
Z3=interp2(double(I2),2,'spline');   %����������ֵ��
Z3=uint8(Z3);
subplot(2,3,4);
imshow(Z3);
title('����������ֵ');
Z4=interp2(double(I2),2,'cubic');    %������ֵ
Z4=uint8(Z4);
subplot(2,3,5);
imshow(Z4);
title('������ֵ');
