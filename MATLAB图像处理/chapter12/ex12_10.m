[X,map]= imread('trees.tif');
i=im2bw(X,map,0.5);
subplot(1,2,1);
imshow(i); 
title('��ֵͼ��') ;
interval=[0 -1 -1;1 1 -1;0 1 0];
i2=bwhitmiss(i,interval);      	%���л������
subplot(1,2,2);
imshow(i2); 
title('���л������') ;
