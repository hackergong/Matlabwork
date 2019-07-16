[RGB]=imread('pears.png'); 	%读取图像
imshow(RGB);
RGBnew(:,:,1)=RGB(:,:,3);    	%下面进行假彩色增强
RGBnew(:,:,2)=RGB(:,:,1);
RGBnew(:,:,3)=RGB(:,:,2);
subplot(121);
imshow(RGB);
title('原始图像');
subplot(122);
imshow(RGBnew);
title('假彩色增强');
