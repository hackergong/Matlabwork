clear
clf
I=checkerboard(40,4);
subplot(121);
imshow(I);             	%��ʾͼ��
title('ԭʼͼ��')
axis on;
s=1.2;T=[s 0;0 s;0 0];
tf=maketform('affine',T);
I1=imtransform(I,tf,'bicubic','FillValues',0.7);	%��ͼ����гߴ�任
subplot(122);
imshow(I1);
title('�ߴ�任')
axis on;
