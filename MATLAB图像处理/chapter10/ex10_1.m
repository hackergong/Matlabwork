I = imread('pout.tif');    	%��ȡͼ��
figure; 
subplot(1,2,1);
imshow(I);
title('ԭͼ��');
LEN = 31;
THETA = 11;
PSF = fspecial('motion',LEN,THETA); 	%��ͼ������˻�����
Blurred = imfilter(I,PSF,'circular','conv');
subplot(1,2,2);
imshow(Blurred);
title('ģ��ͼ��');
