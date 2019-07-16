%__________________________________________________________________________
% The following code implements our scheme for Digital Watermarking of rgb
% images making use of visual cryptography techniques.
% In this scheme the watermark is split into three shares such that the
% logical addition of all three gives back the watermark.
% The rgb image to be marked is also condensed into colour-corresponding three
% streams. Using the three watermark shares respectively for each image stream yields
% three verification matrices which are stored in a single rgb secret
% verification image.
%下面的代码实现了我们利用视觉密码学技术对rgb图像进行数字水印的方案。
%在该方案中，水印被分成三个部分，三个部分的逻辑相加得到水印。
%被标记的rgb图像也被压缩成相应颜色的三个流。对每个图像流分别使用三个水印共享，
%生成三个验证矩阵，这些矩阵存储在一个rgb秘密验证图像中。 
%______________________________________ ____________________________________
clear;
clc; 
%%
img = imread('lena.tif');       % 读入原始图像
%wmark =im2bw(imread('customwmk1.png')); % reads the original watermark in binary
wmark=imread('logo3.tif');      %读入水印图像
wmark = im2bw(wmark);           %灰度图像转化为二值图像
[rows, cols] = size(wmark);     %求出水印图的行列数

mat = randperm(rows*cols); %随机产生与水印图相同大小的数组，且数字都小于10000   
m_a = mat(1, 1: cast(rows*cols/3, 'int64')); %cast将变量转化为不同的数据类型
% generates three arrays each comprising
m_b = mat(1, cast(rows*cols/3, 'int64') : cast(2*rows*cols/3, 'int64')); % a third of the elements in random array
m_c = mat(1, cast(2*rows*cols/3, 'int64'):end); %代表mat数组的第一行，从cast...到end的数、

%%
wshare1= zeros(rows, cols); % initializes the three shares of the watermark
wshare2= zeros(rows, cols); %初始化三个共享水印，行列与水印原图大小相同
wshare3= zeros(rows, cols);

%%
%对水印图像进行处理
for i=1:size(m_a ,2) % size(m_a,2)表示取矩阵的列数。the pixels from the watermark are now stored in the three shares
    index= m_a(i); % such that on logically adding all three the watermark can
    wshare1(index)= wmark(index) ; %将水印图中index位置的像素值赋给wshare1的index位置
end 
for i=1:size(m_b ,2)
    index= m_b(i);
    wshare2(index)= wmark(index) ;
end
for i=1:size(m_c ,2)
    index= m_c(i);
    wshare3(index)= wmark(index) ;
end
%%
%对载体图像进行处理
imshare1= img(:,:,1);% 生成三个要标记的图像共享
imshare2= img(:,:,2); 
imshare3= img(:,:,3);

seed = input('Enter passkey: '); % accepts secret pass key from user

v1 = vgen(imshare1, wshare1 , seed); % generates verification information
v2 = vgen(imshare2, wshare2 , seed);    %生成验证信息
v3 = vgen(imshare3, wshare3 , seed);
v_fin(:,:,1)= v1; % all verification image is stored
v_fin(:,:,2)= v2; % in a single rgb image
v_fin(:,:,3)= v3;
disp('The secret information to be stored with the neutral authority is ')
%要存储在中立权限下的秘密信息是
figure(1)
subplot(2,2,1)
imshow(wshare1)  %水印图片1
title('watermark share 1')
subplot(2,2,2)
imshow(wshare2)     %水印图片2
title('watermark share 2')
subplot(2,2,3)
imshow(wshare3)     %水印图片3
title('watermark share 3')
subplot(2,2,4)
imshow(wmark)       %原水印图片
title('watermark');

figure(2)
imshow(v_fin);
title('Verification information')  %核查信息
imwrite(v_fin, 'rgbsecretim.png');
