a=imread('saturn.png');
a1=imnoise(a,'gaussian',0,0.005);       	%对原始图像加高斯噪声,共得到4幅图像
a2=imnoise(a,'gaussian',0,0.005);
a3=imnoise(a,'gaussian',0,0.005);
a4=imnoise(a,'gaussian',0,0.005);
k=imlincomb(0.25,a1,0.25,a2,0.25,a3,0.25,a4); 		%线性组合
subplot(131);
imshow(a);
title('原始图像')
subplot(132);
imshow(a1);
title('高斯噪声图像')
subplot(133);
imshow(k,[]);
title('线性组合')
