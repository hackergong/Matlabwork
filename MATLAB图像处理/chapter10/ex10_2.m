I=imread('football.jpg');  	%����ͼ��
subplot(221);
imshow(I);
title('ԭʼͼ��');
H=fspecial('motion',30,45);	%�˶�ģ��PSF
MotionBlur=imfilter(I,H);  	%���
subplot(222);
imshow(MotionBlur);
title('�˶�ģ��ͼ��');
H=fspecial('disk',10);    	%Բ��״ģ��PSF
bulrred=imfilter(I,H);
subplot(223);
imshow(bulrred);
title('Բ��״ģ��ͼ��');
H=fspecial('unsharp');   	%�ۻ�ģ��PSF
Sharpened=imfilter(I,H);
subplot(224);
imshow(Sharpened);
title('�ۻ�ģ��ͼ��');
