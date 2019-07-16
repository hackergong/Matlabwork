clear
clf;
I = checkerboard(40,4);
subplot(1,2,1);
imshow(I);                  	%显示图像
title('原始图像')
angle=15*pi/180;
sc=cos(angle);
ss=sin(angle);
T=[sc -ss; ss  sc;0 0];
tf=maketform('affine',T);
I1=imtransform(I,tf,'bicubic','FillValues',0.3); 	%对图像进行旋转变换
subplot(122);
imshow(I1);
title('旋转图像')
