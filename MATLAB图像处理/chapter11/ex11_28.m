I=imread('cameraman.tif');      	%��ȡͼ��
I1=im2col(I,[8 8],'distinct'); 	%���в�������ʵ�ַ����������
I1=ones(64,1)* mean(I1);
I2=col2im(I1,[8,8],size(I),'distinct');
subplot(121),
imshow(I,[]);
title('ԭʼͼ��');
subplot(122),
imshow(I2,[]);  
title('�д�������������');
