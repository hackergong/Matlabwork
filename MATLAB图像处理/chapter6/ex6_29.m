clear all;
I=checkerboard(40,4);
subplot(121);imshow(I);
axis on;
title('Ô­Ê¼Í¼Ïñ')
t=2;T=[1 0;0 t;0 0];
tf=maketform('affine',T);
I1=imtransform(I,tf,'bicubic','FillValues',0.3);
subplot(122);
imshow(I1);
axis on;
title('ÉìËõ±ä»»')
