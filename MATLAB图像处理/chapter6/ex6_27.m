I=imread('office_4.jpg');               	%��ȡͼ��
figure;
subplot(221)
;imshow(I);
title('ԭʼͼ��')
I=double(I);
h=size(I);
I_fliplr(1:h(1),1:h(2),1:h(3))=I(1:h(1),h(2):-1:1,1:h(3)); 	%ˮƽ����任
I1=uint8(I_fliplr);
subplot(222);
imshow(I1);
title('ˮƽ����任')
I_flipud(1:h(1),1:h(2),1:h(3))=I(h(1):-1:1,1:h(2),1:h(3)); 	%��ֱ����任
I2=uint8(I_flipud);
subplot(223);
imshow(I2);
title('��ֱ����任')
I_fliplr_flipud(1:h(1),1:h(2),1:h(3))=I(h(1):-1:1,h(2):-1:1,1:h(3));	%�ԽǾ���任
I3=uint8(I_fliplr_flipud);
subplot(224);
imshow(I3);
title('�ԽǾ���任')
