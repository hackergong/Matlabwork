clear
i=imread('tire.tif');  	%��ȡͼ��
fun=@(x)median(x(:));
b=nlfilter(i,[3 3],fun);	%ʹ�û������������ͼ����д���
subplot(1,2,1);
imshow(i);
title('ԭʼͼ��')
subplot(1,2,2);
imshow(b);
title('����������ͼ��')
