I = imread('mili.bmp');
subplot(2,2,1), 
imshow(I);
I2 = rgb2gray(I);
s = size(I2);
I4 = 255*ones(s(1), s(2), 'uint8');
I5 = imsubtract(I4,I2);
I3 = medfilt2(I5,[5 5]);
I3 = imadjust(I3);
bw = im2bw(I3, 0.3);
bw = bwareaopen(bw, 10);              	%ȥ��ͼ���������С��
subplot(2,2,2), 
imshow(bw);
[labeled,numObjects] = bwlabel(bw,4);    	%�����ͨ������
RGB_label=label2rgb(labeled,@spring,'c','shuffle');	%����ɫ���ÿһ������
subplot(2,2,3), 
imshow(RGB_label);
chrdata = regionprops(labeled,'basic')
allchrs = [chrdata.Area];
num = size(allchrs)
nbins = 20;
subplot(2,2,4), 
hist(allchrs,nbins);
title(num(2))
