clear all;
rgb = imread('peppers.png');
subplot(2,3,1);imshow(rgb);
title('ԭʼͼ��')
I = rgb2gray(rgb);
subplot(2,3,2);imshow(I);
title('�Ҷ�ͼ��')
s=ones(3);
I2=imerode(I,s);
subplot(2,3,3);imshow(I2)
title('��ʴͼ��1')
I3=imdilate(I,s);
subplot(2,3,4);imshow(I3)
title('����ͼ��1')
s1=strel('disk',2);
I4=imerode(I,s1);
subplot(2,3,5);imshow(I4);
I5=imdilate(I,s1);
title('��ʴͼ��2')
subplot(2,3,6);imshow(I5);
title('����ͼ��2')
