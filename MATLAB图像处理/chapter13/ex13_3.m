I = imread('aa.png');
I=rgb2gray(I);
J = histeq(I);          	%ͼ��ľ��⻯
subplot(221);
imshow(I);
title('ԭʼͼ��')
subplot(222);
imshow(J);
title('���⻯ͼ��')
subplot(223);
imhist(I,64)
title('ԭʼͼ��ֱ��ͼ')
subplot(224);
imhist(J,64)
title('���⻯ֱ��ͼ')
