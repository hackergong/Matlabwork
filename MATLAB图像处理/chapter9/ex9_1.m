a=imread('tire.tif');          %��ȡԭʼͼ��
subplot(1,3,1),
imshow(a);                 %��ʾԭʼͼ��
title('ԭʼͼ��');
%��ʾ����������ͼ
x=1:255;
y=x+x.*(255-x)/255;
subplot(1,3,2),
plot(x,y);                   %���Ƶ�����ͼ
title('����������ͼ');
b1=double(a)+0.006*double(a) .*(255-double(a));
subplot(1,3,3),
imshow(uint8(b1));           %��ʾ�����Դ���ͼ��
title('�����Դ���Ч��');
