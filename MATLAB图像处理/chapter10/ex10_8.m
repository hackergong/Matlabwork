I=imread('office_4.jpg');         	%��ȡͼ��
Len=30;
Theta=45;
PSF=fspecial('motion',Len,Theta);   	%ͼ����˻�
BlurredA=imfilter(I,PSF,'circular','conv');
Wnrl=deconvwnr(BlurredA,PSF);
BlurredD=imfilter(I,PSF,'circ','conv');
INITPSF=ones(size(PSF));
[K DePSF]=deconvblind(BlurredD,INITPSF,30); 	%äȥ����޸�ͼ��
BlurredB=imfilter(I,PSF,'conv');
V=0.02;
Blurred_I_Noisy=imnoise(BlurredB,'gaussian',0,V);
NP=V*prod(size(I));
J=deconvreg(Blurred_I_Noisy,PSF,NP);
BlurredC=imfilter(I,PSF,'symmetric','conv');
V=0.002;
BlurredNoisy=imnoise(BlurredC,'gaussian',0,V);
Luc=deconvlucy(BlurredNoisy,PSF,5);
subplot(2,3,1);
imshow(I);
title('ԭʼͼ��');
subplot(2,3,2);
imshow(PSF);
title('�˶�ģ����ͼ��');
subplot(2,3,3);
imshow(Wnrl);
title('ά���˲��޸�ͼ��');
subplot(2,3,4);
imshow(J);
title('��С���˷��޸�ͼ��');
subplot(2,3,5);
imshow(Luc);
title('Lucy-Richardson�޸�ͼ��');
subplot(2,3,6);
imshow(K);
title('äȥ����޸�ͼ��');
