clear all;        %����ռ����
load cathe_1;
subplot(2,3,1);image(X);colormap(map);
title('ԭʼͼ��')
axis square;             
%�������
init=2055615866;
randn('seed',init);
x1=X+20*randn(size(X));
subplot(2,3,2);image(x1);colormap(map);
title('�������')
axis square;             
%��С��db5��ͼ��X����һ��С���ֽ�
w=wpdec2(x1,1,'db5');
%�ع�ͼ����Ʋ���
R=wprcoef(w,[1 0]);
subplot(2,3,3);image(R);colormap(map);
title('���Ʋ���')
axis square;             
%ԭʼͼ���Ե���
W1=edge(X,'sobel');
subplot(2,3,4);imshow(W1)
title(' X�ı�Ե')
axis square;             

%������ͼ���Ե���
W2=edge(x1,'sobel');
subplot(2,3,5);imshow(W2)
title(' x1�ı�Ե')
axis square;             
%ͼ����Ʋ��ֵı�Ե���
W3=edge(R,'sobel');
subplot(2,3,6);imshow(W3)
title('R��Ե')
axis square;             
