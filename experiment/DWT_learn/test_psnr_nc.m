clear all;

io=imread('lena.tif');
% io=rgb2gray(o)
% b=[imageo,imageo,imageo];
% imageo=reshape(b,512,512,3);

ioed=imread('newImage.tif');
[PSNR, MSE]=psnr(io,ioed);

wm=imread('logo3.tif');
wmed=imread('watermarked.tif');
wmed=imresize(wmed,[100,100]);
NC_num = nc(wm,wmed);