I=imread('rice.png');   %����riceͼ��
J=imread('cameraman.tif');   %����cameramanͼ��
K=imadd(I,J,'uint16');   %ͼ����ӣ����ѽ����Ϊ16λ����ʽ��
figure;
subplot(1,3,1);
imshow(I);
 title('riceԭʼͼ��');
subplot(1,3,2);
imshow(J);
 title('cameramanԭʼͼ��');
subplot(1,3,3);
imshow(K,[]);   %ע��ѽ��ѹ����0-255��Χ֮����ʾ
title('���ͼ��');
