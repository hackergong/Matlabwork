%������ͼ����д�������ʾ�����н����ͼ 12 27��ʾ
I = imread('circuit.tif');%��ȡͼ��
figure; subplot(131)
 imshow(I);%��ʾԭͼ��
E = entropyfilt(I);%��������ͼ��
Eim = mat2gray(E);%ת��Ϊ�Ҷ�ͼ��
subplot(132)
imshow(Eim);%��ʾ�Ҷ�ͼ��
BW1 = im2bw(Eim, .8);%ת��Ϊ��ֵͼ��
subplot(133); imshow(BW1);%��ʾ��ֵͼ��
%��ʾͼ��ĵײ��Ͷ������������ͼ 12 28��ʾ
BWao = bwareaopen(BW1,2000);%��ȡ�ײ�����
figure; subplot(221)
imshow(BWao); 
nhood = true(9);
closeBWao = imclose(BWao,nhood);%��̬ѧ�ز���
subplot(222); imshow(closeBWao)%��ʾ��Ե�⻬���ͼ��
roughMask = imfill(closeBWao,'holes');%������
subplot(223)
imshow(roughMask);%��ʾ�����ͼ��
I2 = I;
I2(roughMask) = 0;%�ײ���Ϊ��ɫ
subplot(224); imshow(I2); 
%ͨ��ʹ�ú��ʵ��˲�����ͼ����д������н����ͼ 12 29��ʾ
E2 = entropyfilt(I2);%��������ͼ��
E2im = mat2gray(E2);%ת��Ϊ�Ҷ�ͼ��
figure; subplot(231)
imshow(E2im);%��ʾ����ͼ��
BW2 = im2bw(E2im,graythresh(E2im));%ת��Ϊ��ֵͼ��
subplot(232); imshow(BW2)%��ʾ��ֵͼ��
mask2 = bwareaopen(BW2,1000);%��ȡͼ�񶥲���������Ĥ
subplot(233);imshow(mask2);%��ʾ����������Ĥͼ��
texture1 = I; texture1(~mask2) = 0;%�ײ���Ϊ��ɫ
texture2 = I; texture2(mask2) = 0;%������Ϊ��ɫ
subplot(234)%��ʾͼ�񶥲�
imshow(texture1); subplot(235), 
imshow(texture2);%��ʾͼ��ײ�
boundary = bwperim(mask2);%��ȡ�߽�
segmentResults = I;
segmentResults(boundary) = 255;%�߽紦����Ϊ��ɫ
subplot(236); imshow(segmentResults);%��ʾ���
