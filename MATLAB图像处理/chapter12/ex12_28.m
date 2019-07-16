I = imread('mili.bmp');
I2 = rgb2gray(I);
s = size(I2);
I4 = 255*ones(s(1), s(2), 'uint8');
I5 = imsubtract(I4,I2);
