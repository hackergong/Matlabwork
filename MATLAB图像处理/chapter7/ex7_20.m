load spine;
subplot(121);
image(X);
colormap(map)
title('ԭʼͼ��');
axis square
whos('X')      	%��ͼ����bior3.7С������2��С���ֽ�
[c,s]=wavedec2(X,2,'bior3.7'); 	%��ȡС���ֽ�ṹ�е�һ���Ƶϵ���͸�Ƶϵ��
ca1=appcoef2(c,s,'bior3.7',1);
ch1=detcoef2('h',c,s,1);
cv1=detcoef2('v',c,s,1);
cd1=detcoef2('d',c,s,1);  	%�ֱ�Ը�Ƶ�ʳɷֽ����ع�
a1=wrcoef2('a',c,s,'bior3.7',1);
h1=wrcoef2('h',c,s,'bior3.7',1);
v1=wrcoef2('v',c,s,'bior3.7',1);
d1=wrcoef2('d',c,s,'bior3.7',1);
c1=[a1,h1;v1,d1];       	%��ʾ�ֽ���Ƶ�ʳɷֵ���Ϣ
subplot(122);
image(c1);
axis square
title('�ֽ���Ƶ�͸�Ƶ��Ϣ');
