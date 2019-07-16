load spine;                  %读入图像
YIQMAP=rgb2ntsc(map);     %将NTSC模型转换到RGB模型
map1=ntsc2rgb(YIQMAP);
YIQMAP=mat2gray(YIQMAP);
Ymap=[YIQMAP(:,1),YIQMAP(:,1),YIQMAP(:,1)];
Imap=[YIQMAP(:,2),YIQMAP(:,2),YIQMAP(:,2)];
Qmap=[YIQMAP(:,3),YIQMAP(:,3),YIQMAP(:,3)];
subplot(2,3,1);
subimage(X,map);
title('原始图像')
subplot(2,3,2);
subimage(X,YIQMAP);
title('转换图像')
subplot(2,3,3);
subimage(X,map1);
title('还原图像')
subplot(2,3,4);
subimage(X,Ymap);
title('NTSC的Y分量')
subplot(2,3,5);
subimage(X,Imap);
title('NTSC的I分量')
subplot(2,3,6);
subimage(X,Qmap);
title('NTSC的Q分量')  
