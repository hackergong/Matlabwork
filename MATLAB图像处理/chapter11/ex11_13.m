I=imread('rice.png');              	%��ȡͼ��
subplot(121),
imshow(I);
title('ԭʼͼ��')
level=graythresh(I);
BW=im2bw(I,level);         	%�����䷽��ָ�ͼ��
subplot(122),
imshow(BW)
title('�Զ���ֵ���ָ�ͼ��')
disp(strcat('graythresh ����Ҷ���ֵ��',num2str(uint8(level*255))))
