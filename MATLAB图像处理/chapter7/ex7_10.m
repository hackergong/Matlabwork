clear all;
I = imread('eight.tif');       %��ȡ�Ҷ�ͼ��
subplot(1,3,1), 
imshow(I)
title('ԭʼͼ��')
[m,n]=size(I);                %ͼ��ߴ�
In=imnoise(I,'speckle',0.05);    %�������
subplot(1,3,2), 
imshow(In)
title('�������')
J = dct2(In);
X=zeros(m,n);
X(1:m/3,1:n/3)=1;        
Ydct=J.*X;
J1=uint8(idct2(Ydct));  %��DCT�任
subplot(1,3,3), 
imshow(J1)
title('DCT�����ͼ��')
