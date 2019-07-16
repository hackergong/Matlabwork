clear all;
I = checkerboard(40,4);
subplot(1,2,1);
imshow(I);
axis on;
title('原始图像')
Angle=60;
s=2;As=[s 0;0 s];       % 尺度变换
t=2;At=[1 0;0 t];       % 伸缩变换
u=1.5;Au=[1 u;0 1];     % 扭曲变换
st=30*pi/180;sc=cos(Angle);ss=sin(Angle);
Ast=[sc -ss; ss  sc];    % 旋转变换
T=[As*At*Au*Ast;3 5];
tf=maketform('affine',T);
I1=imtransform(I,tf,'bicubic','FillValues',0.3);
subplot(122);
imshow(I1);
axis on;
title('综合仿射变换')
