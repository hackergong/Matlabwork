load trees
subplot(1,2,1);
imshow(X,map);
I=ind2gray(X,map)          %������ͼ��ת��Ϊ�Ҷ�ͼ��
title('ԭʼͼ��');
subplot(1,2,2);
imshow(I);
title('�Ҷ�ͼ��');
