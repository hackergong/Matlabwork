I=imread('pears.png');
level = graythresh(I);    	%�õ����ʵ���ֵ
bw = im2bw(I,level);      	%��ֵ��
SE = strel('square',3);       	%�������ͽṹԪ��
BW1 = imdilate(bw,SE);       	%����
SE1 = strel('arbitrary',eye(5)); 	%���ø�ʴ�ṹԪ��
BW2 = imerode(bw,SE1);      	%��ʴ
BW3 = bwmorph(bw, 'open');   	%������
BW4 = bwmorph(bw, 'close');   	%������
subplot(2,3,1);
imshow(I);
title('ԭʼͼ��') ;
subplot(2,3,2);
imshow(bw);
title('��ֵ�����ͼ��');
subplot(2,3,3);
imshow(BW1);
title('���ʹ����ͼ��');
subplot(2,3,4);
imshow(BW2);
title('��ʴ�����ͼ��');
subplot(2,3,5);
imshow(BW3);
title('������');
subplot(2,3,6);
imshow(BW4);
title('������');
