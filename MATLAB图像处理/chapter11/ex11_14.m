clear all;
I = imread('circuit.tif');  
subplot(2,2,1);imshow(I)
title('ԭʼͼ��')
background = imopen(I,strel('disk',15));
I2 = I - background;
subplot(2,2,2), imshow(I2)
title('ȥ��������ͼ��')
I3 = imadjust(I2); %����ͼ��ĻҶ�ֵ������ͼ��ĶԱȶ�
subplot(2,2,3), imshow(I3);
title('��ǿ�Աȶ�')
 [level,EM] = graythresh(I3) %��ֵ��ͼ��
bw = im2bw(I3,level);
subplot(2,2,4), imshow(bw)
title('�Զ���ֵ��')
