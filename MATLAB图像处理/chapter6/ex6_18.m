clear all;
I = imread('coins.png');
subplot(221);imshow(I);
title ('ԭʼͼ��')
background = imopen(I,strel('disk',15));
Ip = imdivide(I,background);
subplot(222);
imshow(Ip,[])
title ('ͼ���뱳�����')
J = imdivide(I,3);
subplot(2,2,3),
 imshow(J)
title ('ͼ����3���Ч��')
K = imdivide(I,0.6);
subplot(2,2,4), 
imshow(K)
title ('ͼ����0.6���Ч��')
