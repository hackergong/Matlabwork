clear all;
I = imread('eight.tif');
subplot(1,2,1);imshow(I);
title('ԭʼͼ��');
BW = edge(imrotate(I,50,'crop'),'prewitt');
[H,T,R] = hough(BW);
P = houghpeaks(H,2);    %��ȡ��ֵ
subplot(1,2,2);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit'); %��ʾHouhg�任
title('Houhg�任');
xlabel('\theta ��'), ylabel('\rho ��');
axis on, axis normal, 
hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');   %�����ɫΪ��ɫ
