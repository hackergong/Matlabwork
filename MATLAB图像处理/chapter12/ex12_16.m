I=imread('text.png');   	%�����ֵͼ��
subplot(1,3,1);
imshow(I);
title('ԭʼͼ��') ;
BW1=im2bw(I);
subplot(1,3,2);
imshow(BW1);
title('��ֵͼ��') ;
BW2=imfill(BW1,'holes');  	%ִ�������
subplot(1,3,3);
imshow(BW2);
title('���ͼ��') ;
