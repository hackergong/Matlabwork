% main program to test the watermarking technique
% See report A. Bultheel, 
% Digital watermarking of images in the fractional Fourier domain
% Report TW497, Detp. Computer Science, K.U.Leuven, July 2007
% Needs the routines
%    WMembed.m
%    WMdetect.m
%    addnoise.m
%    PSNR.m
%    nwcrop.m
%    centralcrop.m
%    frft2d.m -> Disfrft.m
% and the image
%    lena.jpg
% to run.
%

tic

% Original image

image = imread('lena.jpg');

figure(1);
imagesc(real(image));
colormap(gray); axis('equal','tight','off');
title('Original image');

% embed watermark(s)

L = [96000, 90000, 100000];
M = [800, 800, 400];
var = [50, 100, 30];

powers = [0.8, 0.5];

[wm_image,keys,ix] = WMembed(image,L,M,var,powers);

figure(2); imagesc(real(wm_image));
colormap(gray); axis('equal','tight','off');
title('watermarked image')

wm_image = (uint8(wm_image));
imwrite(wm_image,'image.jpg','jpg');
wm_image = imread('image.jpg');


wm_image = uint8(wm_image);
imwrite(wm_image,'lenawm.jpg','jpg');
wm_image = imread('image.jpg');

% detection

disp(' ')
disp('************************');
disp('detect after compression');
disp('************************');

PSNR(ind2gray(uint8(image),gray)/256,ind2gray(uint8(wm_image),gray)/256)

global fignum
fignum=10;
[d,threshold] = WMdetect(wm_image,keys,ix,L,M,var,powers);

% attacks

noisy_wm_image = addnoise(wm_image,50);
noisy_wm_image = uint8(real(noisy_wm_image));

figure(3); imagesc(noisy_wm_image);
colormap(gray); axis('equal','tight','off')
title('noisy watermarked image')


disp(' ')
disp('*****************');
disp('detect with noise');
disp('*****************');

PSNR(ind2gray(uint8(image),gray)/256,ind2gray(uint8(noisy_wm_image),gray)/256)

fignum = 20;
[d,threshold] = WMdetect(noisy_wm_image,keys,ix,L,M,var,powers);

crop_noisy_wm_image = nwcrop(noisy_wm_image,100,512);
%crop_noisy_wm_image = centralcrop(noisy_wm_image,150,150);

crop_noisy_wm_image = uint8(real(crop_noisy_wm_image));

figure(4); imagesc(crop_noisy_wm_image);
colormap(gray); axis('equal','tight','off')
title('cropped noisy watermarked image')


disp(' ')
disp('*************************');
disp('detect cropped with noise');
disp('*************************');

PSNR(ind2gray(uint8(image),gray)/256,ind2gray(uint8(crop_noisy_wm_image),gray)/256)

fignum=30;
[d,threshold] = WMdetect(crop_noisy_wm_image,keys,ix,L,M,var,powers);

toc
