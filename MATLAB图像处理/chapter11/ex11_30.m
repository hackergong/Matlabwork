I=imread('blobs.png');  	%��ȡͼ��
c=[222  272  300  270  221  194];
r=[21  21  75  121  121  75];
BW=roipoly(I,c,r);  	%��ָ����������˲�����
f=inline('uint8(abs(double(x)-100))');
J=roifilt2(I,BW,f);
subplot(121),
subimage(I);
title('ԭʼͼ��');
subplot(122),
subimage(J);  
title('����ѡ������ͼ��');
