I1=imread('liftingbody.png');   	%读取图像
S=qtdecomp(I1,0.25);	%其中0.25为每个方块所需要达到的最小差值
I2=full(S); 
subplot(1,2,1);
imshow(I1);         	%显示前后两张图片
title('原图像')
subplot(1,2,2);
imshow(I2);
title('四叉树分解的图像')
