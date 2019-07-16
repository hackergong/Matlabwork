I=imread('pears.png');
level = graythresh(I);    	%得到合适的阈值
bw = im2bw(I,level);      	%二值化
SE = strel('square',3);       	%设置膨胀结构元素
BW1 = imdilate(bw,SE);       	%膨胀
SE1 = strel('arbitrary',eye(5)); 	%设置腐蚀结构元素
BW2 = imerode(bw,SE1);      	%腐蚀
BW3 = bwmorph(bw, 'open');   	%开运算
BW4 = bwmorph(bw, 'close');   	%闭运算
subplot(2,3,1);
imshow(I);
title('原始图像') ;
subplot(2,3,2);
imshow(bw);
title('二值处理的图像');
subplot(2,3,3);
imshow(BW1);
title('膨胀处理的图像');
subplot(2,3,4);
imshow(BW2);
title('腐蚀处理的图像');
subplot(2,3,5);
imshow(BW3);
title('开运算');
subplot(2,3,6);
imshow(BW4);
title('闭运算');
