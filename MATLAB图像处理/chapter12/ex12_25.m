clear all;
BW = imread('circbw.tif');
subplot(1,3,1);imshow(BW);
title('原始图像')
lut = makelut('sum(x(:)) == 4',2);    %查找表
BW2 = applylut(BW,lut);               %查找表的二值图像处理
subplot(1,3,2); imshow(BW2)
title('查找表的二值图像处理')
B=[8 4;2 1];                %验证2×2邻域
C=conv2(double(BW),B);    %卷积运算
C=uint8(C)+1;          %转换成double类型计算
lut8=uint8(lut);     %转换成uint8
isize=size(C);
for i=1:isize(1)
    for j=1:isize(2);
        tmp=C(i,j);
        C(i,j)=lut8(tmp);
    end
end
C=logical(C);
isize2=size(BW2);
isizeC=size(C);
tmpsize=isizeC-isize2;
%提取图像的有效部分
C=C((tmpsize(1)+1):isizeC(1),(tmpsize(2)+1):isizeC(2));
subplot(1,3,3);imshow(C);
title('验证图像');
breturn=min(min(C==BW2));
disp(strcat('applylut和验证结果：',num2str(breturn)))
