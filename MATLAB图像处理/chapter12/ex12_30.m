%对纹理图像进行创建并显示。运行结果如图 12 27所示
I = imread('circuit.tif');%读取图像
figure; subplot(131)
 imshow(I);%显示原图像
E = entropyfilt(I);%创建纹理图像
Eim = mat2gray(E);%转化为灰度图像
subplot(132)
imshow(Eim);%显示灰度图像
BW1 = im2bw(Eim, .8);%转化为二值图像
subplot(133); imshow(BW1);%显示二值图像
%显示图像的底部和顶部纹理。结果如图 12 28所示
BWao = bwareaopen(BW1,2000);%提取底部纹理
figure; subplot(221)
imshow(BWao); 
nhood = true(9);
closeBWao = imclose(BWao,nhood);%形态学关操作
subplot(222); imshow(closeBWao)%显示边缘光滑后的图像
roughMask = imfill(closeBWao,'holes');%填充操作
subplot(223)
imshow(roughMask);%显示填充后的图像
I2 = I;
I2(roughMask) = 0;%底部置为黑色
subplot(224); imshow(I2); 
%通过使用合适的滤波器对图像进行处理。运行结果如图 12 29所示
E2 = entropyfilt(I2);%创建纹理图像
E2im = mat2gray(E2);%转化为灰度图像
figure; subplot(231)
imshow(E2im);%显示纹理图像
BW2 = im2bw(E2im,graythresh(E2im));%转化为二值图像
subplot(232); imshow(BW2)%显示二值图像
mask2 = bwareaopen(BW2,1000);%求取图像顶部的纹理掩膜
subplot(233);imshow(mask2);%显示顶部纹理掩膜图像
texture1 = I; texture1(~mask2) = 0;%底部置为黑色
texture2 = I; texture2(mask2) = 0;%顶部置为黑色
subplot(234)%显示图像顶部
imshow(texture1); subplot(235), 
imshow(texture2);%显示图像底部
boundary = bwperim(mask2);%求取边界
segmentResults = I;
segmentResults(boundary) = 255;%边界处设置为白色
subplot(236); imshow(segmentResults);%显示结果
