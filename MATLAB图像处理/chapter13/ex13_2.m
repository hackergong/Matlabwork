clc
clear
f=imread('breast.tif');  %%%����ͼ��
subplot(2,2,1);                  %%%��ͬһ����������ʾ�ัͼ��
imshow(f),title('ԭʼͼ��')
g1=imadjust(f,[0 1],[1 0]); %��ԭʼͼ��Ҷȷ�ת
subplot(2,2,2);
imshow(g1),title('�Ҷȷ�ת')
g2=imadjust(f,[0.6 0.8],[0 1]); %%%��ԭʼͼ��0.6��0.8֮��ĻҶȼ���չ��[0 1]
subplot(2,2,3);
imshow(g2),title('��������Ҷȱ任')
%%%��gammaֵ����Ϊ2
g3=imadjust(f,[ ],[ ],2);
subplot(2,2,4);
imshow(g3),title('gamma=2 ')
