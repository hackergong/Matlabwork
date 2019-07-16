%对图像进行读取并加强。
I = imread('bag.png');%读取图像
figure; subplot(231);imshow(I)%显示原图像
title('原始图像');
claheI = adapthisteq(I,'NumTiles',[10 10]); 
claheI = imadjust(claheI);%亮度调整
subplot(234);imshow(claheI);%显示增强后的图像
title('增强后的图像');

%对图像中粒度大小的分布进行计算。
for counter = 0:22
    remain = imopen(claheI, strel('disk', counter));%开操作
    intensity_area(counter + 1) = sum(remain(:));%剩余像素和
end
subplot(232);plot(intensity_area, 'm - *'), %显示不同半径开操作后剩余的像素和
title('不同半径开操作后剩余的像素和');
grid on;
%对不同半径下的粒度分布进行计算。
intensity_area_prime= diff(intensity_area);%差分
subplot(235);plot(intensity_area_prime, 'm - *'), %显示每个半径下的粒度多少
title('每个半径下的粒度');

grid on;
set(gca, 'xtick', [0 2 4 6 8 10 12 14 16 18 20 22]);
open5 = imopen(claheI,strel('disk',5));%半径为5的形态学开操作
open6 = imopen(claheI,strel('disk',6));%半径为6的形态学开操作
rad5 = imsubtract(open5,open6);%半径为5的粒度
subplot(233);imshow(rad5,[]);%显示半径为5下图像中粒度分布情况
title('粒度分布情况');
