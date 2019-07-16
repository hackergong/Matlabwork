clear all;
rgb = imread('peppers.png');
subplot(2,3,1);imshow(rgb);
title('Ô­Ê¼Í¼Ïñ')
I = rgb2gray(rgb);
subplot(2,3,2);imshow(I);
title('»Ò¶ÈÍ¼Ïñ')
s=ones(3);
I2=imerode(I,s);
subplot(2,3,3);imshow(I2)
title('¸¯Ê´Í¼Ïñ1')
I3=imdilate(I,s);
subplot(2,3,4);imshow(I3)
title('ÅòÕÍÍ¼Ïñ1')
s1=strel('disk',2);
I4=imerode(I,s1);
subplot(2,3,5);imshow(I4);
I5=imdilate(I,s1);
title('¸¯Ê´Í¼Ïñ2')
subplot(2,3,6);imshow(I5);
title('ÅòÕÍÍ¼Ïñ2')
