J=imread('breast.png')
figure,
subplot(121);
imshow(J);
title('ԭʼͼ��');
J=double(J);
lapMatrix=[1 1 1;1 -8 1;1 1 1];       	%������˹ģ��
J_tmp=imfilter(J,lapMatrix,'replicate'); 	%�˲�
I=imsubtract(J,J_tmp);          	%ͼ�����
subplot(122);
imshow(I),
title('��ͼ��');
