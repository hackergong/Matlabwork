clf
I=imread('coins.png');  	%��ȡͼ��
c=[222 272 300 270 221 194];
r=[21  21  75  121 121  75];
J=roifill(I,c,r);   	%��ָ������������
subplot(121),
imshow (I);
title('ԭʼͼ��');
subplot(122),
imshow (J);  
title('�������');
