RGB=imread('greens.jpg'); 
HSV=rgb2hsv(RGB);        %��RGBģ��ת����HSVģ��
subplot(1,2,1),
imshow(RGB),
title('RGBͼ��'); 
subplot(1,2,2),
imshow(HSV),
title('HSVͼ��');
