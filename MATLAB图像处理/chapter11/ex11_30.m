I=imread('blobs.png');  	%读取图像
c=[222  272  300  270  221  194];
r=[21  21  75  121  121  75];
BW=roipoly(I,c,r);  	%对指定区域进行滤波处理
f=inline('uint8(abs(double(x)-100))');
J=roifilt2(I,BW,f);
subplot(121),
subimage(I);
title('原始图像');
subplot(122),
subimage(J);  
title('区域选择运算图像');
