[RGB]=imread('pears.png'); 	%��ȡͼ��
imshow(RGB);
RGBnew(:,:,1)=RGB(:,:,3);    	%������мٲ�ɫ��ǿ
RGBnew(:,:,2)=RGB(:,:,1);
RGBnew(:,:,3)=RGB(:,:,2);
subplot(121);
imshow(RGB);
title('ԭʼͼ��');
subplot(122);
imshow(RGBnew);
title('�ٲ�ɫ��ǿ');
