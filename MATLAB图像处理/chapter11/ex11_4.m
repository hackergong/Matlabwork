I=imread('eight.tif');
BW1=edge(I,'Roberts',0.04);    	%Roberts算子
BW2=edge(I,'Sobel',0.04);    	%Sobel算子
BW3=edge(I,'Prewitt',0.04);        	%Prewitt算子
BW4=edge(I,'LOG',0.004);         	% LOG算子
BW5=edge(I,'Canny',0.04);         	% Canny算子
subplot(2,3,1),
imshow(I)
title('原图像')
subplot(2,3,2),
imshow(BW1)
title('Roberts ')
subplot(2,3,3),
imshow(BW2)
title(' Sobel ')
subplot(2,3,4),
imshow(BW3)
title(' Prewitt ')
subplot(2,3,5),
imshow(BW4)
title(' LOG ')
subplot(2,3,6),
imshow(BW5)
title('Canny ')
