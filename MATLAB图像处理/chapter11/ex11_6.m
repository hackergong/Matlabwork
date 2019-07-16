clear all;
RGB = imread('peppers.png');
I = rgb2gray(RGB);
BW = edge(I,'canny'); %����Ե
 [H,T,R] = hough(BW,'RhoResolution',0.5,'Theta',-90:0.5:89.5); %����Hough�任��
subplot(1,2,1);imshow(RGB);
title('ԭʼͼ��');
subplot(1,2,2);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
      'InitialMagnification','fit');
title('Hough�任');
xlabel('\theta ��'), ylabel('\rho ��');
axis on, axis normal, 
hold on;
colormap(hot);
