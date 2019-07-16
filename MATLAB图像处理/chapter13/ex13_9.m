%��ȡ����ʾͼ����ʾ��ע����
I= imread('moon.tif'); %ԭʼͼ��
figure; subplot(131);imshow(I)
BW = I > 0;%��ֵͼ��
L = bwlabel(BW);%��ע����
subplot(132); 
imshow(label2rgb(L))%��ɫ��ʾ��ע����
%���ĺͼ�Ȩ���ĵļ��㡣
s = regionprops(L, I, {'Centroid','WeightedCentroid'});%��ȡ���ĵ�
subplot(133); 
imshow(I)%��ʾԭͼ
hold on
numObj = numel(s);
for k = 1 : numObj
    plot(s(k).WeightedCentroid(1), ...
        s(k).WeightedCentroid(2), 'r*');%��ԭͼ����ʾ��Ȩ����
    plot(s(k).Centroid(1), s(k).Centroid(2), 'bo');%��ԭͼ����ʾ����
end	
hold off
%ͳ�����ʵļ��㣬���н����ͼ 13 10��ʾ��
s = regionprops(L, I, ...
    {'Centroid','PixelValues','BoundingBox'});%�����ġ�����ֵ����Χ����
figure,subplot(131);
imshow(I);%��ʾԭͼ
hold on
for k = 1 : numObj
    s(k).StandardDeviation = std(double(s(k).PixelValues));%��׼��
    text(s(k).Centroid(1),s(k).Centroid(2), ...
        sprintf('%2.1f', s(k).StandardDeviation), ...
        'EdgeColor','b','Color','g');
end
hold off; subplot(132);
bar(1:numObj,[s.StandardDeviation]);%��ʾ��׼��
sStd = [s.StandardDeviation];
lowStd = find(sStd < 50);%�ҳ���׼��С��50��Ŀ��
subplot(133);imshow(I);%��ʾԭͼ
hold on;
for k = 1 : length(lowStd)
    rectangle('Position', s(lowStd(k)).BoundingBox, ...
        'EdgeColor','y');%���α�ע��ѡĿ��
end
hold off;
