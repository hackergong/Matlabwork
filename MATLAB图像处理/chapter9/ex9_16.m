clear all;   %����������˹���Ӷ�ģ��ͼ�������ǿ
I=imread('rice.png');
subplot(1,2,1);imshow(I);
title('ԭʼͼ��');
I=double(I);  %ת����������Ϊdouble˫������
H=[0 1 0,1 -4 1,0 1 0];  %������˹����
J=conv2(I,H,'same');  %��������˹���Ӷ�ͼ����ж�ά�������
K=I-J; 
subplot(1,2,2),imshow(K,[])
title('���˲�����')
