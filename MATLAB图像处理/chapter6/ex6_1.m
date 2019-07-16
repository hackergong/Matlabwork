clear all;
a=imread('rice.png');               
subplot(2,3,1);imshow(a);
title('原始图像')
b1=a+50;                                %图像灰度值增加45
subplot(2,3,2);imshow(b1);
title ('灰度值增大')
b2=1.2*a;                                %图像对比度增大
subplot(2,3,3);imshow(b2)
title ('对比度增大')
b3=0.65*a;                                %图像对比度减少
subplot(2,3,4);imshow(b3);
title ('对比度减小')
b4=-double(a)+255;        %图像求补，注意把a的类型转换为double
subplot(2,3,5);imshow(uint8(b4));               %再把double类型转换为unit8
title ('图像求补运算')
