clear
RGB=imread('onion.png');         	%����ͼ��
YCbCr=rgb2ycbcr(RGB);         	%��RGBģ��ת����YCbCrģ��
subplot(1,2,1);
subimage(RGB);
title('ԭͼ��');
subplot(1,2,2);
subimage(YCbCr);
title('�任���ͼ��');
