[I,map]=imread('forest.tif');
X=ind2rgb(I,map);          %������ͼ��ת��ΪRGBͼ��
subplot(1,2,1);
imshow(I,map);
title('ԭʼͼ��');
subplot(1,2,2);
imshow(X);
title('RGBͼ��');
