I=imread('coins.png');  
A=imnoise(I,'salt & pepper', 0.02);
subplot(2,2,1);
imshow(A);
title('��ӽ�������ͼ��')
h=fspecial('gaussian',10,5);  	%������˹�˲���
A1=imfilter(A,h);    	%��ͼ������˲�
subplot(2,2,2);
imshow(A1)  
title('�˲�����')
level=graythresh(A1);  	%��ȡ�ʵ��Ķ�ֵ����ֵ
BW=im2bw(A1,level);  	%ͼ���ֵ��
subplot(2,2,3);
imshow(BW) 
title('��ֵ��')
BW1=bwmorph(A,'skel',Inf);	%�Ǽ���ȡ
subplot(2,2,4);
imshow(BW1) 
title('�Ǽ���ȡ')
