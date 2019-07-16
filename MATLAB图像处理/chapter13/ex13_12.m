%读取图像并通过裁剪出需要配准的子区域。
hestain = imread('hestain.png');%读取hestain图像
peppers = imread('peppers.png');%读取peppers图像
figure; subplot(221)
imshow(hestain) 
title(' hestain ');
subplot(222),
imshow(peppers) 
title(' peppers ');
%读取图像并通过裁剪出需要配准的子区域
rect_hestain = [111 33 65 58];%确定hestain图像的区域
rect_peppers = [163 47 143 151];%确定peppers图像的区域
sub_hestain = imcrop(hestain,rect_hestain); 
sub_peppers = imcrop(peppers,rect_peppers); 
subplot(223),
imshow(sub_hestain) 
title(' hestain的子区域 ');
subplot(224),
imshow(sub_peppers) 
title(' peppers的子区域 ');
