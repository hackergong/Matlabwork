f=imread('rice.png');
subplot(1,2,1),
imshow(f)
title('原始图像')
Ha=[1 1 1 1
       1 -1 1 -1
       1 1 -1 -1
       1 -1 -1 1];
fd=double(f);
g=conv2(fd,Ha);
g=uint8(g);
subplot(1,2,2),
imshow(g)
title('沃尔什与哈达玛变换后图像')
