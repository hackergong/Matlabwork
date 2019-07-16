% 打开原图
imOri=imread('lena.jpg');
%缩放、灰度化原图
imOri=imresize(imOri,[512 512]);    
% imOri=rgb2gray(imOri);       

% 打开水印图
[imWat,map1]=imread('QQ.png');
% 缩放、灰度化水印图
figure('name','non-watermark');
imshow(imWat)
imWat=imresize(imWat,[512 512]);

% imWat=rgb2gray(imWat);

% 加水印后的图
imNew=uint8(double(imOri)+0.05*double(imWat));

% 保存加水印后的图
imwrite(imNew,'lena-QQ.png')

% 绘图 
figure('name','watermark');
imshowpair(imOri,imNew,'montage')
imNew=imread('lena-QQ.png');
figure('name','提取出的水印图');
imagesc(uint8((double(imNew)-double(imOri))/0.05))

Y=uint8((double(imNew)-double(imOri))/0.05);

figure('name','水印图');
imshow(Y)

[PSNR, MSE]=psnr1(imOri,imNew)









