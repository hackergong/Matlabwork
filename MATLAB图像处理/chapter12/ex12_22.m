i=imread('tire.tif');    	%��ȡͼ��
A=imhmin (i,45);    	%����imhmin������ͼ����д���
subplot(1,2,1);
imshow(i); 
title('ԭʼͼ��') ;
subplot(1,2,2);
imshow(A); 
title('���Ƽ�Сֵ') ;
