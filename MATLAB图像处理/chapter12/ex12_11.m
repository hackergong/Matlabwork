bw=imread('circbw.tif');
subplot(2,2,1);
imshow(bw); 
title('原始图像') ;
bw2=bwmorph(bw,'remove');  	%移除内部像素
subplot(2,2,2);
imshow(bw2);
title('移除内部像素') ;
bw3=bwmorph(bw,'skel',Inf); 	%骨架提取
subplot(2,2,3);
imshow(bw3); 
title('骨架提取') ;
bw4=bwmorph(bw3,'spur',Inf);  	%消刺
subplot(2,2,4);
imshow(bw4); 
title('消刺') ;
