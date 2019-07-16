%图像的逻辑运行。
clear all;
I=imread('trees.tif');
subplot(2,3,1);imshow(I);
title('原始图像')
J=imdivide(I,2);
K1=bitand(I,J);
subplot(2,3,2);
imshow(K1);
title('位与运算')
K2=bitcmp(I,8);              %等价于2^8-I
subplot(2,3,3);
imshow(K2);
title('位补运算')
K3=bitor(I,J);
subplot(2,3,4);
imshow(K3);
title('位或运算')
K4=bitxor(I,J);
subplot(2,3,5);
imshow(K4);
title('位异或运算')
K5=bitshift(I,2);
subplot(2,3,6);
imshow(K5);
title('位移运算')
