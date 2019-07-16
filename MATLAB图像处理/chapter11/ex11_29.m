clf
I=imread('rice.png');            	%读取图像
c=[222 272 300 270 221 194];	%对指定区域进行锐化
r=[21  21  75  121 121  75];
BW=roipoly(I,c,r);
h=fspecial('unsharp');    	%滤波函数
J=roifilt2(h,I,BW);
subplot(121),
subimage(I);
title('原始图像');
subplot(122),
subimage(J);  
title('区域滤波图像');
