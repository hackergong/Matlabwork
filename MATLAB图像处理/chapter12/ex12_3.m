i=imread('eight.tif'); 	%��ȡͼ��
se=strel('ball',5,5);
i2=imdilate(i,se);  	%�������ʹ���
subplot(1,2,1);
imshow(i); 
title('ԭʼͼ��') ;
subplot(1,2,2);
imshow(i2); 
title('���ʹ�����ͼ��')
