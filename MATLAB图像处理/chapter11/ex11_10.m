clear all
I = imread('blobs.png');
figure(1)
subplot(1,2,1);
imshow(I),title('ԭʼͼ��')
B = bwboundaries(I); %��ȡ�߽�
D= B{1,1};
subplot(1,2,2);
plot(D(:,2),D(:,1)) %����һ���߽�
set(gca,'YDir','reverse') %��תy ������
title('�߽��Ǻ�ͼ��')
