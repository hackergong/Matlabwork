RGB=imread('tape.png');
subplot(131),
imshow(RGB);
title('ԭʼͼ��');
I=rgb2gray(RGB);   	%ת��Ϊ�Ҷ�ͼ��
subplot(132),
imshow(I);
title('�Ҷ�ͼ��');
J=dct2(I);            	%ʹ��dct2��ͼ�����DCT�任
subplot(133),
imshow(log(abs(J)),[]),colormap(jet(64));
title('DCT�任');
