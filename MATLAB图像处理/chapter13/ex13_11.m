%��ͼ����ж�ȡ����ѡ�����Ҫ�����Ƕȵ�����
RGB = imread('tape.png');%��ȡͼ��
subplot(221);imshow(RGB);%��ʾ
title('ԭʼͼ��');
line([300 328],[85 103],'color',[1 1 0]);%��ֱ��
line([268 255],[85 140],'color',[1 1 0]);%��ֱ��
start_row = 34;%ѡȡͼ�����ʼ��
start_col = 208;%ѡȡͼ�����ʵ��
cropRGB = RGB(start_row:163, start_col:400, :);%ȷ��ͼ������
subplot(222);imshow(cropRGB)%��ʾ
title('������');

%�Խǵ�ֱ�߽߱���ж�ȡ��
offsetX = start_col-1;%x�����ƫ����
offsetY = start_row-1;%y�����ƫ����
I = rgb2gray(cropRGB);%ת��Ϊ�Ҷ�ͼ��
threshold = graythresh(I);%��ֵ
BW = im2bw(I,threshold);%ת��Ϊ��ֵͼ��
BW = ~BW;%ȡ��
subplot(223);imshow(BW)%��ʾ��ֵͼ��
title('��ֵ��ͼ��');

dim = size(BW);%ͼ���С
col1 = 4;%ˮƽ�����ʼ��
row1 = min(find(BW(:,col1)));%ˮƽ�����ʼ��
row2 = 12;%��һֱ�ߵ���ʵ��
col2 = min(find(BW(row2,:)));%��һֱ�ߵ���ʼ��
boundary1 = bwtraceboundary(BW, [row1, col1], 'N', 8, 70);%ˮƽ�߽�
boundary2 = bwtraceboundary(BW, [row2, col2], 'E', 8, 90,...
    'counter');%��һֱ�ߵı߽�
subplot(224);imshow(RGB); %��ʾԭͼ��
title('��ȡ�ı߽�Ƕ�');
hold on;
plot(offsetX+boundary1(:,2),offsetY+boundary1(:,1),'g',...
    'LineWidth',2);%��ʾˮƽ�����ֱ��
plot(offsetX+boundary2(:,2),offsetY+boundary2(:,1),'g',...
    'LineWidth',2);%��ʾ��һ�����ֱ��
%�Ƕȵļ��㡣
ab1 = polyfit(boundary1(:,2), boundary1(:,1), 1);%���ֱ��
ab2 = polyfit(boundary2(:,2), boundary2(:,1), 1);%���ֱ��
vect1 = [1 ab1(1)];  vect2 = [1 ab2(1)];
dp = dot(vect1, vect2);%���
length1 = sqrt(sum(vect1.^2));%����
length2 = sqrt(sum(vect2.^2));%����
angle = 180-acos(dp/(length1*length2))*180/pi%����Ƕ�
intersection = [1 ,-ab1(1); 1,-ab2(1)] \ [ab1(2); ab2(2)];%���λ��
intersection = intersection + [offsetY; offsetX]%����ʵ������
inter_x = intersection(2);%�����x������
inter_y = intersection(1);%�����y������
plot(inter_x,inter_y,'yx','LineWidth',2);%��ԭͼ�ϱ�ע����
