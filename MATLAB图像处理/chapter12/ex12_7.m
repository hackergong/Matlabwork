IM2=imclose(IM,SE)
IM2=imclose(IM,NHOOD)
imclose函数与imopen函数用法相类似，这里不在赘述。
对图像进行闭运算。
i=imread('testpat1.png');   	%读取图像
subplot(1,2,1);
imshow(i); 
title('原始图像') ;
se=strel('disk',10);
bw=imclose(i,se);    	%闭运算
subplot(1,2,2);
imshow(bw); 
title('闭运算') ;
