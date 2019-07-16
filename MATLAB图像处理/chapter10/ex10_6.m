I=imread ('football.jpg');       	%��ȡͼ��
PSF=fspecial('gaussian',5,5) ;
Blurred=imfilter(I,PSF,'symmetric','conv'); 
V=.003; 
BN=imnoise(Blurred,'gaussian',0,V); 
luc=deconvlucy(BN,PSF,5);  	%����Lucy-Richardson�˲��ָ���ԭ
figure
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');
subplot(2,2,2);
imshow (Blurred);
title('ģ�����ͼ��');
subplot(2,2,3);
imshow (BN);
title('������ͼ��');
subplot(2,2,4);
imshow (luc);
title('�ָ����ͼ��');
