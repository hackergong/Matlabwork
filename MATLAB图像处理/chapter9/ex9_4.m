for i=0:255;
    f=power((i+0.5)/256,1/2.2);
    LUT(i+1)=uint8(f*256-0.5);
end  
img=imread('onion.png');     	%读入图像
img0=rgb2ycbcr(img);
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);
Y=img0(:,:,1);
Yu=img0(:,:,1);
[x y]=size(Y);
for row=1:x
    for width=1:y
        for i=0:255
        if (Y(row,width)==i)
             Y(row,width)=LUT(i+1);
             break; 
        end
        end
    end
end
img0(:,:,1)=Y;
img1=ycbcr2rgb(img0);
R1=img1(:,:,1);
G1=img1(:,:,2);
B1=img1(:,:,3);
subplot(1,2,1);
imshow(img);         	%显示图像
title('原图');
subplot(1,2,2);
imshow(img1);
title('Gamma矫正后的图像')
