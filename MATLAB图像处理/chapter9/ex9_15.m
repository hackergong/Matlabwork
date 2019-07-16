I=imread('tape.png');
subplot(231),
imshow(I);
title('原图像');
I=rgb2gray(I);
J=imnoise(I,'salt & pepper',0.04);
subplot(232),imshow(J);title('添加椒盐噪声图像');
k1= wiener2 (J);       	%进行3*3模板中值滤波
k2= wiener2 (J,[5,5]); 	%进行5*5模板中值滤波
k3= wiener2 (J,[7,7]); 	%进行7*7模板中值滤波
k4= wiener2 (J,[9,9]);    	%进行9*9模板中值滤波
subplot(233),
imshow(k1);
title('3*3模板中值滤波');
subplot(234),
imshow(k2);
title('5*5模板中值滤波 ');
subplot(235),
imshow(k3);
title('7*7模板中值滤波');
subplot(236),
imshow(k4);
title('9*9 模板中值滤波');
