%��ͼ����ж�ȡ��������ת��Ϊ��ֵͼ��
RGB = imread('pears.png');%��ȡͼ��
figure; subplot(221);imshow(RGB);%��ʾ
title('ԭʼͼ��');
I = rgb2gray(RGB);%ת��Ϊ�Ҷ�ͼ��
threshold = graythresh(I);%��ֵ
bw = im2bw(I,threshold);%ת��Ϊ��ֵͼ��
subplot(222);imshow(bw)%��ʾ��ֵͼ��
title('��ֵͼ��');
%��ͼ���е�Ŀ��ı߽����Ѱ�ҡ�
bw = bwareaopen(bw,30);%ȥ��СĿ��
se = strel('disk',2);%Բ�νṹԪ��
bw = imclose(bw,se);%�ز���
bw = imfill(bw,'holes');%���׶�
subplot(223); imshow(bw)%��ʾ���׶����ͼ��
title('������ͼ��');
 [B,L] = bwboundaries(bw,'noholes');%ͼ��߽�
subplot(224);imshow(label2rgb(L, @jet, [.5 .5 .5]))%��ͬ��ɫ��ʾ
title('Բ��Ŀ���ȷ��');
hold on
for k = 1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1), 'w', 'LineWidth', 2)%��ʾ��ɫ�߽�
end
%��ͼ����Բ��Ŀ���ȷ����
stats = regionprops(L,'Area','Centroid');%��ȡ��������ĵ�
threshold = 0.94;%��ֵ
for k = 1:length(B)
  boundary = B{k};
  delta_sq = diff(boundary).^2;
  perimeter = sum(sqrt(sum(delta_sq,2)));%��ȡ�ܳ�
  area = stats(k).Area;%���
  metric = 4*pi*area/perimeter^2;%Բ�ε�����
  metric_string = sprintf('%2.2f',metric);
  if metric > threshold
    centroid = stats(k).Centroid;
    plot(centroid(1),centroid(2),'ko');%���Բ��
  end
  text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color',...
      'y', 'FontSize',14,'FontWeight','bold');%��עԲ�ζ���
End
