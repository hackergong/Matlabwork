RGB=imread('onion.png'); 
HSV=rgb2hsv(RGB);        %��HSVģ��ת����RGBģ��
RGB1=hsv2rgb(HSV);
subplot(1,3,1),
imshow(RGB),
title('RGBͼ��'); 
subplot(1,3,2),
imshow(HSV),
title('HSVͼ��'); 
subplot(1,3,3),
imshow(RGB1),
title('��ԭ��ͼ��');
