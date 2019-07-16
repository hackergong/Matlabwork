%��ȡͼ��
I = imread('rice.png');%��ȡͼ��
figure;  imshow(I), %��ʾͼ��

%����ͼ��ı�Ե��
[junk threshold] = edge(I, 'sobel');%��Ե���
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);%�ı�����ټ���Ե
figure; subplot(221),
imshow(BWs), %��ʾ��ֵͼ��
se90 = strel('line', 3, 90);%��ֱ�����ԽṹԪ��
se0 = strel('line', 3, 0);%ˮƽ�����ԽṹԪ��
BWsdil = imdilate(BWs, [se90 se0]);%��ͼ���������
subplot(222); imshow(BWsdil), %��ʾ���ͺ�Ķ�ֵͼ��
BWdfill = imfill(BWsdil, 'holes');%��ͼ��������
subplot(223); imshow(BWdfill);%��ʾ����Ķ�ֵͼ��
BWnobord = imclearborder(BWdfill, 4); 
subplot(224); imshow(BWnobord), %���н����ͼ 12 16��ʾ

seD = strel('diamond',1);%���νṹԪ��
BWfinal = imerode(BWnobord,seD);%��ʴͼ��
BWfinal = imerode(BWfinal,seD);%��ʴͼ��
figure; subplot(121)
imshow(BWfinal), %��ʾ������ͼ��
BWoutline = bwperim(BWfinal); 
Segout = I;
Segout(BWoutline) = 255;
subplot(122), imshow(Segout), %��ԭʼͼ������ʾ�߽�
