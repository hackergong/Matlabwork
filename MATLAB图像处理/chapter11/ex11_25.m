I=imread('cell.tif');  	%��ȡͼ��
I1=im2col(I,[3 3],'sliding');  	%�в�����ͼ��ʵ�ֻ���
I1=uint8([0 -1 0 -1 4 -1 0 -1 0]*double(I1));
I2=col2im(I1,[3,3],size(I),'sliding');
subplot(121),
imshow(I,[]);
title('ԭʼͼ��');
subplot(122),
imshow(I2,[]);  
title('����������ͼ��')
