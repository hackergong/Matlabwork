clear all;
RGB = imread('peppers.png');
I = rgb2gray(RGB);
BW = edge(I,'canny'); %ºÏ≤‚±ﬂ‘µ
 [H,T,R] = hough(BW,'RhoResolution',0.5,'Theta',-90:0.5:89.5); %º∆À„Hough±‰ªª£¨
subplot(1,2,1);imshow(RGB);
title('‘≠ ºÕºœÒ');
subplot(1,2,2);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
      'InitialMagnification','fit');
title('Hough±‰ªª');
xlabel('\theta ÷·'), ylabel('\rho ÷·');
axis on, axis normal, 
hold on;
colormap(hot);
