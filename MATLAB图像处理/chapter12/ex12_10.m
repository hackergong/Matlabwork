[X,map]= imread('trees.tif');
i=im2bw(X,map,0.5);
subplot(1,2,1);
imshow(i); 
title('二值图像') ;
interval=[0 -1 -1;1 1 -1;0 1 0];
i2=bwhitmiss(i,interval);      	%击中或击不中
subplot(1,2,2);
imshow(i2); 
title('击中或击不中') ;
