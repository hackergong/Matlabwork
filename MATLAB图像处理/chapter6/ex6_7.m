clear all;
bw = imread('circbw.tif');
bw2 = imcomplement(bw);
subplot(2,3,1),
imshow(bw)
title('��ֵԭʼͼ��')
subplot(2,3,4),
imshow(bw2)
title('��ֵͼ����')
I = imread('cell.tif');
J = imcomplement(I);
subplot(2,3,2),
imshow(I)
title('�Ҷ�ԭʼͼ��')
subplot(2,3,5),imshow(J)
title('�Ҷ�ͼ����')
RGB=imread('onion.png');
RGB1=imcomplement(RGB);
subplot(2,3,3),imshow(RGB)
title('RGBԭʼͼ��')
subplot(2,3,6),
imshow(RGB1)
title('RGBͼ����')
