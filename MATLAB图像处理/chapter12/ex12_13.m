clear all;
BW1 = imread('circles.png'); 
BW2 = bwmorph(BW1,'skel',Inf);
subplot(221);imshow(BW1)
title('��ֵͼ��')
subplot(222); imshow(BW2)
title('ͼ��ĹǼ�')
BW3 = bwperim(BW1);
subplot(223);imshow(BW1)
title('ͼ��')
subplot(224), imshow(BW3)
title('ͼ��߽�')
