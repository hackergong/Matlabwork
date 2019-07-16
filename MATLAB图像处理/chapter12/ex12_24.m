i=imread('rice.png');      	%读取图像
subplot(1,3,1);
imshow(i); 
title('原始图像') ;
m1=false(size(i));
m1(64:71,64:71)=true;
j=i;
j(m1)=255;
subplot(1,3,2);
imshow(j); 
title('标记图像上的叠加') ;
k=imimposemin(i,m1);    	%抑制极小值
subplot(1,3,3);
imshow(k); 
title('抑制极小值') ;
