Y=imread('onion.png');
subplot(131),
imshow(Y)
title('ԭʼͼ��');
I= rgb2gray(Y);	%ת��Ϊ�Ҷ�ͼ��
J=dct2(I);
K=idct2(J);
subplot(132),
imshow(K,[0 255])
title('�Ҷ�ͼ��');
J(abs(J)<9)=0; 	%����ϵ��
K2=idct2(J);
subplot(133),
imshow(K2,[0 255])
title('�ع�ͼ��');
