I=imread('aa.png');
switch class(I)        	%图像的求反过程
case'uint8'
m=2^8-1;
I1=m - I;
case'uint16'
m=2^16-1;
I1=m-I;
case'double'
m=max(I(:));
I1=m-I;
end
figure;
subplot(1,2,1);
imshow(I);
title('原始图像')
subplot(1,2,2);
imshow(I1);
title('图像负片效果');
