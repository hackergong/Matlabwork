
% ��ȡ����ͼ��
I = imread('lenna_RGB.jpg');
I = imresize(I,[540,960]);

% ת��Ϊ�Ҷ�ͼ
YUV = rgb2ycbcr(I);
Y = YUV(:,:,1); U = YUV(:,:,2); V = YUV(:,:,3);


% ��ȡˮӡͼ��
W = imread('logo3.tif');

% ת��Ϊ��ֵͼ
 level = graythresh(W);
 W = im2bw(W,0.5);

% �ü�Ϊ�������
W = imresize(W,[150,150]);

subplot(221)
imshow(I);
title('����ͼ��');
set(get(gca,'title'),'fontname','΢���ź�');

subplot(222)
imshow(W);
title('ˮӡͼ��');
set(get(gca,'title'),'fontname','΢���ź�');
