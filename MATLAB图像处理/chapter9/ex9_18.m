I=imread('coins.png');%����ͼ��
subplot(2,2,1),
imshow(I);
title('ԭʼͼ��');%��ʾԭͼ��
H=fspecial('sobel'); %Ӧ��sobel������ͼ��
I2=filter2(H,I); %sobel�����˲���
subplot(2,2,2);
imshow(I2); %��ʾsobel������ͼ��
title('sobel������ͼ��');
H1=fspecial('prewitt');%Ӧ��prewitt������ͼ��
I3=filter2(H1,I);%prewitt�����˲���
subplot(2,2,3);imshow(I3); %��ʾprewitt������ͼ��
title('prewitt������ͼ��');
H2=fspecial('log'); %Ӧ��log������ͼ��
I4=filter2(H2,I); %log�����˲���
subplot(2,2,4);
imshow(I4);%��ʾlog������ͼ��
title('log������ͼ��');
