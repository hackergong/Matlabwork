I=imread('circuit.tif');
subplot(2,2,1),
imshow(I);
title('原始图像')
J1=imnoise(I,'gaussian',0,0.02); 		%叠加均值为0，方差为0.02的高斯噪声
subplot(2,2,2),
imshow(J1);
title('高斯噪声图像')
J2=imnoise(I,'salt & pepper',0.04); 	%叠加密度为0.04的椒盐噪声 
subplot(2,2,3),
imshow(J2);
title('椒盐噪声图像')
J3=imnoise(I, 'speckle',0.04);   		%叠加密度为0.04的乘法噪声 
subplot(2,2,4),
imshow(J2);
title('乘法噪声图像')
