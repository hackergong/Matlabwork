clear all
close all
I=imread('rice.png');
figure, subplot(1,3,1);
imshow(I),title('ԭʼͼ��')
subplot(1,3,2);
imhist(I),title('ֱ��ͼ')   % �۲�Ҷ�ֱ��ͼ
I1=im2bw(I,120/255); % im2bw ������Ҫ���Ҷ�ֵת����[0,1]��Χ��
subplot(1,3,3);
imshow(I1),title('ֱ��ͼ��ֵ���ָ���')
