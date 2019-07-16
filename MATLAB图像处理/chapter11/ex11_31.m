clf
I=imread('coins.png');  	%读取图像
c=[222 272 300 270 221 194];
r=[21  21  75  121 121  75];
J=roifill(I,c,r);   	%对指定区域进行填充
subplot(121),
imshow (I);
title('原始图像');
subplot(122),
imshow (J);  
title('区域填充');
