clear
[A,map]=imread('autumn.tif');             	%��ȡͼ��
J=imrotate(A,40,'bilinear');             	%��ͼ�������ת
subplot(1,2,1),
imshow(A,map);
title('ԭʼͼ��')
subplot(1,2,2),
imshow(J,map);
title('��ת���ͼ��')
