I=imread('office_4.jpg');
I1=rgb2gray(I);
subplot(1,2,1),imshow(I1);
title('�Ҷ�ͼ��');
axis([50,250,50,200]);
grid on;          	%��ʾ������
axis on;       	%��ʾ����ϵ
J=double(I1);
J=40*(log(J+1));
H=uint8(J);
subplot(1,2,2),
imshow(H);
title('�����任ͼ��');
axis([50,250,50,200]);
grid on; 
axis on;       
