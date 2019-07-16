clear
clf
I=checkerboard(40,4);
subplot(121);
imshow(I);             	%显示图像
title('原始图像')
axis on;
s=1.2;T=[s 0;0 s;0 0];
tf=maketform('affine',T);
I1=imtransform(I,tf,'bicubic','FillValues',0.7);	%对图像进行尺寸变换
subplot(122);
imshow(I1);
title('尺寸变换')
axis on;
