RGB = imread('peppers.png');%��ȡͼ��
figure; subplot(131);imshow(RGB);%��ʾ
title('ԭʼͼ��');
I = rgb2gray(RGB);%ת��Ϊ�Ҷ�ͼ��
threshold = graythresh(I);%��ֵ
BW = im2bw(I,threshold);%ת��Ϊ��ֵͼ��
subplot(132);imshow(BW)%��ʾ��ֵͼ��
title('��ֵͼ��');

%ͼ��߽�Ļ�ȡ��
dim = size(BW);%ͼ���С
col = round(dim(2)/2)-90;%�߽���ʼ�����
row = find(BW(:,col), 1);%�߽���ʼ�����
connectivity = 8;%��ͨ��Ϊ8
num_points   = 180;%�߽��ĸ���
contour = bwtraceboundary(BW, [row, col], 'N',...
    connectivity, num_points);%��ȡԲ��
subplot(133);imshow(RGB);%��ʾԭͼ��
title('�������');
hold on;
plot(contour(:,2),contour(:,1),'g','LineWidth',2);%��ʾ��ɫ�߽�

%�뾶�ļ��㡣
x = contour(:,2); y = contour(:,1);
abc = [x y ones(length(x),1)] \ -(x.^2+y.^2);%�������
a = abc(1); b = abc(2); c = abc(3);
xc = -a/2;%Բ�ĵ�x������
yc = -b/2;%Բ�ĵ�y������
radius  =  sqrt((xc^2+yc^2)-c)%�뾶
plot(xc,yc,'yx','LineWidth',2);%���Բ��
theta = 0:0.01:2*pi;
Xfit = radius*cos(theta) + xc;
Yfit = radius*sin(theta) + yc;
plot(Xfit, Yfit);%����ɫ��ʾ��һ�λ�
message = sprintf('�뾶�Ĺ���ֵ��%2.3f ����', ...
    radius);
text(15,15,message,'Color','y','FontWeight','bold');
