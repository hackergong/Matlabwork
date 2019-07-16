clc
clear all
RGB = imread('saturn.png');     
figure
subplot(1,3,1);
imshow(RGB);
title('ԭʼͼ��')
I = rgb2gray(RGB);            
threshold = graythresh(I);     
BW = im2bw(I,threshold);        %���Ҷ�ͼ��ת��Ϊ��ֵͼ��
subplot(1,3,2);
imshow(BW)
title('��ֵͼ��')
dim = size(BW);
col = round(dim(2)/2)-90;       %������ʼ��������
row = find(BW(:,col), 1);       %������ʼ��������
connectivity = 8;
num_points = 180;
contour = bwtraceboundary(BW, [row, col], 'N', connectivity, num_points);     %��ȡ�߽�
subplot(1,3,3);
imshow(RGB);
hold on;
plot(contour(:,2),contour(:,1),'g','LineWidth',2);
title('���ͼ��')
