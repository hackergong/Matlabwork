load woman;
subplot(221);
image(X);
colormap(map);
title('ԭʼͼ��');
axis square
init=2055615866;randn('seed',init)     	%��������ͼ��
x=X+38*randn(size(X));
subplot(222);
image(x);
colormap(map);
title('��������ͼ��');
axis square;
[c,s]=wavedec2(x,2,'sym4');          	%��С������sym4��x����2��С���ֽ�
a1=wrcoef2('a',c,s,'sym4');     	%��ȡС���ֽ��е�һ��ĵ�Ƶͼ��
subplot(223);image(a1);
title('��һ��ȥ��');
axis square;
a2=wrcoef2('a',c,s,'sym4',2);         	%��ȡС���ֽ��еڶ���ĵ�Ƶͼ��
subplot(224);
image(a2);
title('�ڶ���ȥ��');
axis square;
