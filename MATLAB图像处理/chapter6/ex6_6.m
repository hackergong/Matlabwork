I=imread('tire.tif');  	%��ȡͼ��
subplot(2,2,1),
imshow(I);
title('ԭʼͼ��')
hgram=50:2:250;  	%�涨������
J=histeq(I,hgram);
subplot(2,2,2),
imshow(J);
title('ͼ��Ĺ涨��')
subplot(2,2,3),
imhist(I,64);
title('ԭʼͼ��ֱ��ͼ')
subplot(2,2,4),
imhist(J,64);
title('�涨����ֱ��ͼ')
