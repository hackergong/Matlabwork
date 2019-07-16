clear all
I=imread('three_brothers.tif');
imshow(I);
I=double(I);
for i=1:7
    I1=I.^(0.4+0.05*i);
    imshow(uint8(I1));
    pause(1)
end

