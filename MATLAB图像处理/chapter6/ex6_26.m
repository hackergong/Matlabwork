clear all;
[I,map]=imread('trees.tif');
figure;
subplot(121);imshow(I,map);
%ָ����������Ĵ�С��λ�ã�����ͼ�񣬲��������꣨x,y���ͼ�������rect
[x,y,I2,rect] = imcrop(I, map,[75 68 130 112]);
subplot(122);imshow(I2);
x,y,rect
