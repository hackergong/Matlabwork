clear all
I = imread('tape.png');                 %����ͼ��
figure(1),
subplot(1,3,1);
imshow(I),title('ԭʼͼ��')
BW = im2bw(I, graythresh(I));           %���ɶ�ֵͼ��
subplot(1,3,2);
imshow(BW),title('��ֵͼ��')
 [B,L] = bwboundaries(BW,'noholes'); %��ȡ�߽磬�����ر߽�Ԫ������B �������־����L
subplot(1,3,3);
imshow(label2rgb(L, @jet, [.5 .5 .5]))  %�Բ�ͬ����ɫ��־��ͬ������
title('��ɫ���ͼ��')
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)   %��ͼ���ϵ����߽�
end
