
importimage;

% ��Կ1��Arnold���Ҵ���
ntimes = 25;

% ��Կ2�����������
rngseed = 59433;

% �Ƿ���ʾ�м�ͼ��
flag = 1;

% ˮӡǶ��
[Uw,psnr] = setdwtwatermark(U,W,ntimes,rngseed,flag);

K = YUV; K(:,:,2) = Uw;
figure;
K = ycbcr2rgb(K);
imshow(K);
title('ˮӡǶ���ͼ��')
set(get(gca,'title'),'fontname','΢���ź�');


[Wg,nc,idx] = getdwtwatermark(Uw,W,ntimes,rngseed,flag);