I=imread('peppers.png');       	%����ͼ��
PSF=fspecial('motion',10,30); 
Blurred=imfilter(I,PSF,'circ','conv') ;
INITPSF=ones(size(PSF)); 
[J P]=deconvblind (Blurred,INITPSF,20); 	%��ͼ�����äȥ����˲���ԭ
figure
subplot(1,3,1);
imshow (I);
title('ԭʼͼ��');
subplot(1,3,2);
imshow (Blurred);
title('ģ�����ͼ��')
subplot(1,3,3);
imshow (J);
title('�ָ����ͼ��');
