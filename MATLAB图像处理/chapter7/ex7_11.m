clear;
close all 
I=imread('eight.tif'); 
subplot( 121),
imshow(I);
title('ԭʼͼ��');
I=im2double(I);
T=dctmtx(8);
B=blkproc(I,[8 8], 'P1*x*P2',T,T');
Mask=[ 	1 1 1 1 0 0 1 1
        1 1 1 0 0 0 0 1
        1 1 0 0 0 0 0 0
        1 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        1 1 0 0 0 0 1 1
        1 1 0 0 0 0 1 1];
B2=blkproc(B,[8 8],'P1.*x',Mask); 	%�˴�Ϊ���
I2=blkproc(B2,[8 8], 'P1*x*P2',T',T);
subplot(122),
imshow(I2);        	%�ؽ����ͼ��
title('DCT�ع�');
