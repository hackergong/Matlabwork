I=imread ('cell.tif'); 
PSF=fspecial('gaussian',10,4); 
Blurred=imfilter(I,PSF,'conv'); 
V=.03;
BN=imnoise(Blurred,'gaussian',0,V); 
NP=V*prod(size(I)); 
[reg LAGRA]=deconvreg(BN,PSF,NP); 
Edged=edgetaper(BN,PSF); 
reg2=deconvreg(Edged,PSF,NP/1.2);    	%��������
reg3=deconvreg(Edged,PSF,[],LAGRA); 	%������������
figure
subplot(2,3,1);
imshow (I);
title('ԭʼͼ��');
subplot(2,3,2);
imshow (BN);
title('�����˹������ͼ��');
subplot(2,3,3);
imshow (reg);
title('�ָ����ͼ��');
subplot(2,3,4);
imshow(reg2);
title('��������ͼ��');
subplot(2,3,5);
imshow(reg3);
title('�����������ӻָ�ͼ��');
