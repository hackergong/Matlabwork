load spine;                  %����ͼ��
YIQMAP=rgb2ntsc(map);     %��NTSCģ��ת����RGBģ��
map1=ntsc2rgb(YIQMAP);
YIQMAP=mat2gray(YIQMAP);
Ymap=[YIQMAP(:,1),YIQMAP(:,1),YIQMAP(:,1)];
Imap=[YIQMAP(:,2),YIQMAP(:,2),YIQMAP(:,2)];
Qmap=[YIQMAP(:,3),YIQMAP(:,3),YIQMAP(:,3)];
subplot(2,3,1);
subimage(X,map);
title('ԭʼͼ��')
subplot(2,3,2);
subimage(X,YIQMAP);
title('ת��ͼ��')
subplot(2,3,3);
subimage(X,map1);
title('��ԭͼ��')
subplot(2,3,4);
subimage(X,Ymap);
title('NTSC��Y����')
subplot(2,3,5);
subimage(X,Imap);
title('NTSC��I����')
subplot(2,3,6);
subimage(X,Qmap);
title('NTSC��Q����')  
