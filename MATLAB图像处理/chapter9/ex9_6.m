I=imread('circuit.tif');
subplot(2,2,1),
imshow(I);
title('ԭʼͼ��')
J1=imnoise(I,'gaussian',0,0.02); 		%���Ӿ�ֵΪ0������Ϊ0.02�ĸ�˹����
subplot(2,2,2),
imshow(J1);
title('��˹����ͼ��')
J2=imnoise(I,'salt & pepper',0.04); 	%�����ܶ�Ϊ0.04�Ľ������� 
subplot(2,2,3),
imshow(J2);
title('��������ͼ��')
J3=imnoise(I, 'speckle',0.04);   		%�����ܶ�Ϊ0.04�ĳ˷����� 
subplot(2,2,4),
imshow(J2);
title('�˷�����ͼ��')
