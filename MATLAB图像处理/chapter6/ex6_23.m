clear all;
I=imread('football.jpg');  %IΪԭʼͼ��
figure;
subplot(131);imshow(I); %��ʾԭʼͼ��
title('ԭʼͼ��')
I=double(I);
I_en=imresize(I,4,'nearest');  %����ڷ���־����nearest����4��
subplot(132);imshow(uint8(I_en)); %��ʾ����4�����ͼ��
title('����4�����ͼ��')
I_re=imresize(I,0.5,'nearest');  %��С����
subplot(133);imshow(uint8(I_re));%��ʾ��С2�����ͼ��
title('��С2�����ͼ��')
