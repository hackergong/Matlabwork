clear
RGB=imread('peppers.png');
YCbCr=rgb2ycbcr(RGB);         	%��YCbCrģ��ת����RGBģ��
subplot(1,3,1);
subimage(RGB);
title('ԭͼ��');
subplot(1,3,2);
subimage(YCbCr);
title('�任���ͼ��');
RGB2=ycbcr2rgb(YCbCr);
subplot(1,3,3);
subimage(RGB2);
title('��ԭ��ͼ��');
