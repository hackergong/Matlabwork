clf
I=imread('rice.png');            	%��ȡͼ��
c=[222 272 300 270 221 194];	%��ָ�����������
r=[21  21  75  121 121  75];
BW=roipoly(I,c,r);
h=fspecial('unsharp');    	%�˲�����
J=roifilt2(h,I,BW);
subplot(121),
subimage(I);
title('ԭʼͼ��');
subplot(122),
subimage(J);  
title('�����˲�ͼ��');
