f=imread('rice.png');
subplot(1,2,1),
imshow(f)
title('ԭʼͼ��')
Ha=[1 1 1 1
       1 -1 1 -1
       1 1 -1 -1
       1 -1 -1 1];
fd=double(f);
g=conv2(fd,Ha);
g=uint8(g);
subplot(1,2,2),
imshow(g)
title('�ֶ�ʲ�������任��ͼ��')
