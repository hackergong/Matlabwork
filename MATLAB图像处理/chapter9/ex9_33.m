load clown;
subplot(131);
image(X);
colormap(map);
title('ԭʼͼ��');
axis square
init=2055615866; 	%����������ͼ��
randn('seed',init)
x=X+10*randn(size(X));
subplot(132);
image(X);
colormap(map);
title('������ͼ��');
axis square
[c,s]=wavedec2(x,2,'coif3');  	%��С������coif3��x����2��С���ֽ�
n=[1,2] ;                       	%���ó߶�����n
p=[10.12,23.28];                	%������ֵ����p
nc=wthcoef2('h',c,s,n,p,'s');
nc=wthcoef2('v',c,s,n,p,'s');
nc=wthcoef2('d',c,s,n,p,'s');
xx=waverec2(nc,s,'coif3');     	%���µ�С���ֽ�ṹ[nc��s]�����ع�
subplot(133);
image(X);
colormap(map);
title('ȥ����ͼ��');
axis square
