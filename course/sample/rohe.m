I1=imread('three_brothers.TIF');
I2=imread('photograph.TIF');

I1=double(I1);
I2=double(I2);
for i=1:7
    I1=I1.^(0.4+0.05*i);
    figure;
    imshow(uint8(I1));
   
end
for i=1:7
    I2=I2.^(0.4+0.05*i);
    figure;
    imshow(uint8(I2));
    
end