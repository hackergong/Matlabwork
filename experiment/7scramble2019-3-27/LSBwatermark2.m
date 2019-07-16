%% 准备工作空间
clc
clear all
close all
%% 第一张 cameraman

img = imread('cameraman.tif');
imgsize=size(img);

%提取bitplane比特平面
bitPlane=zeros(imgsize(1),imgsize(2),8); %创建一个imgsize(1)行，imgsize(2)列的矩阵，共八层
for i =1:8
    for ro=1:imgsize(1)         % r  o: row图片行号，y
        for co=1:imgsize(2)      %co: column图片,x
        bitPlane(ro,co,i)=bitget(img(ro,co),  i);  %返回整数数组img(ro,co)中位于i的位值
        end        
    end    
end
% 绘制bitplane   
figure('name','载体图像分八层');
for i =1:8
    subplot(2,4,i)
    imshow(uint8(255*bitPlane(:,:,i)))
    title(['Bitplane' num2str(i)])

% set(get(gca,'title'),'fontname','微软雅黑');

end

%% 第二张 lena

imgW = imread('lena.jpg');
imgW=imresize(imgW,0.5);   %调整图像大小，0.5为将图像缩小原来的0.5倍
imgWsize=size(imgW);
[h, w]=size(imgW);
figure('name','原水印图像');
imshow(imgW)
[imgs] = scramble(imgW);

%提取bitplane
bitPlaneW=zeros(imgWsize(1),imgWsize(2),8); 
for i =1:8
    for ro=1:imgWsize(1)
        for co=1:imgWsize(2)
        bitPlaneW(ro,co,i)=bitget(imgs(ro,co), i);
        end        
    end    
end
% 绘制bitplane
figure('name','水印原图像分层');
for i =1:8
    subplot(2,4,i)
    imshow(uint8(255*bitPlaneW(:,:,i))) 
    title(['Bitplane' num2str(i)])
end

%% 构造新的bitPlane
newbitPlane=bitPlane;
newbitPlane(:,:,3) = bitPlaneW(:,:,8);    %水印图像高位比特图
newbitPlane(:,:,2) = bitPlaneW(:,:,7);
newbitPlane(:,:,1) = bitPlaneW(:,:,6);
%% 产生新图片（含水印）

newimg=zeros(256,256);
for i =1:8
    newimg=newimg+newbitPlane(:,:,i)*2^(i-1);
end
newimg=uint8(newimg);
figure('name','水印图片');
imshow(newimg);

%% 查看水印图与原图区别
 figure('name','查看水印图与原图区别')
 subplot(1,3,1)
 imshow(img)
 title('载体图')
 set(get(gca,'title'),'fontname','微软雅黑');
 subplot(1,3,2)
 imshow(newimg)
 title('含水印图')
 set(get(gca,'title'),'fontname','微软雅黑');
 dNC = nc(img,newimg);
 subplot(1,3,3)
 title(['NC=' num2str(dNC)])

%% 水印提取过程

%提取bitplane
bitPlaneRec=zeros(imgWsize(1),imgWsize(2),8);   %创建一个新的位平面
for i =1:8
    for ro=1:imgWsize(1)
        for co=1:imgWsize(2)
        bitPlaneRec(ro,co,i)=bitget(newimg(ro,co), i);     %将水印图像每一层都分解到新的位平面
        end        
    end    
end
% 绘制bitplane
figure;
for i =1:8
    subplot(2,4,i)
    imshow(uint8(255*bitPlaneRec(:,:,i)))
    title(['Bitplane' num2str(i)])    
end

%% 复原水印图

newimgW=zeros(imgWsize(1),imgWsize(2));
for i =1:3
    newimgW=newimgW+bitPlaneRec(:,:,i)*2^(4+i);
end
for i=1:5
    newimgW=newimgW+ bitPlaneW(:,:,i+3);
end
newimgww=newimgW;
[h1,w1]=size(newimgww);
[imgr] = recover(newimgww,h1,w1);
%% 转化为rgb图

% T=mat2gray(uint8(newimgW))
% [X,map]=gray2ind(T),
% I=ind2rgb(X,map);
% figure('name','提取出的水印');
% imshow(I)


%% 将复原的水印与原水印进行NC比较

 figure('name','查看原水印与提取的水印NC值')
 subplot(1,3,1)
 imshow(imgW)
 title('原水印图')
 set(get(gca,'title'),'fontname','微软雅黑');
 subplot(1,3,2)
 imshow(uint8(imgr))
 title('提取的水印图')
 set(get(gca,'title'),'fontname','微软雅黑');
 dNC = nc(imgW,imgr);
 subplot(1,3,3)
 title(['NC=' num2str(dNC)])
 
 [PSNR, MSE]=psnr1(img,newimg);
 
 










