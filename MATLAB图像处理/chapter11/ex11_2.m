I=imread('rice.png');
BW1=edge(I,'Roberts',0.04);   	%Roberts���Ӽ���Ե
subplot(1,2,1),
imshow(I);
title('ԭͼ��')
subplot(1,2,2),
imshow(BW1);
title('Roberts���Ӽ���Ե')
