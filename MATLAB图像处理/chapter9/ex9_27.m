RGB=imread('peppers.png');       	%读取图像
subplot(221),
imshow(RGB)
title('原始真彩色图像')
subplot(222),
imshow(RGB(:,:,1))        	%开始对真彩色图像进行分解
title('真彩色图像的红色分量')
subplot(223),
imshow(RGB(:,:,2))
title('真彩色图像的绿色分量')
subplot(224),
imshow(RGB(:,:,3))
title('真彩色图像的蓝色分量')
