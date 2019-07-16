I=imread('eight.tif');
figure(1)
subplot(2,3,1);imshow(I)
title('原始图像')
subplot(2,3,2);imhist(I)            %显示图像的直方图
title('直方图')            
I0=edge(I,'sobel');                 %自动选择阈值的sobel算法
I1=edge(I,'sobel',0.06);            %指定阈值为0.06
I2=edge(I,'sobel',0.04);            %指定阈值为0.04
I3=edge(I,'sobel',0.02);            %指定阈值为0.02
subplot(2,3,3);imshow(I0)                
title('默认门限')
subplot(2,3,4);imshow(I1)                     
title('阈值为0.06')
subplot(2,3,5);imshow(I2)
title('阈值为0.04')
subplot(2,3,6);imshow(I3)
title('阈值为0.02')
