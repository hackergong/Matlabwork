I=imread('rice.png');
subplot(131),
imshow(I);
title('ԭʼͼ��');
H=hadamard(256);
%hadamad����
I=double(I)/255;        	%��������ת��
hI=H*I*H; %Hadamard�任
hI=hI/256;
subplot(132)
imshow(hI);
title('��ά��ɢHadamard�任');
subplot(133)
cI=dct2(I);        	%��ɢ���ұ任
imshow(cI);
title('��ά��ɢ���ұ任');
