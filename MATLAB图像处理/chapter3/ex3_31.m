RGB=imread('onion.png'); 
[X,MAP]=rgb2ind(RGB,0.7);        %�����ɫͼ��ת��������ɫͼ��
subplot(1,2,1);
imshow(RGB);
title('ԭʼͼ��');
subplot(1,2,2);
imshow(X,MAP);
title('����ͼ��');
