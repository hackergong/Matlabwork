RGB=imread('onion.png');
X=rgb2gray(RGB);           %��һ�����ɫͼ��ת���ɻҶ�ͼ��
subplot(1,2,1);
imshow(RGB);
title('ԭʼͼ��');
subplot(1,2,2);
imshow(X); 
title('�Ҷ�ͼ��');
