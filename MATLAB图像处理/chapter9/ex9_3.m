clear
I=imread('glass.png');      			%��ȡͼ��
subplot(2,2,1);
imshow(I);
title('ԭͼ��');
subplot(2,2,2);
imhist(I);
title('ԭͼ��ֱ��ͼ');
subplot(2,2,3);
J=imadjust(I,[],[0.4 0.6]);			%����ͼ��ĻҶȵ�ָ����Χ
imshow(J);
title('�����ҶȺ��ͼ��');
subplot(2,2,4);
imhist(J);
title('�����ҶȺ��ֱ��ͼ');
