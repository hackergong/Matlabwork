[x,y,z] = cylinder;
I = imread('zh.tif');
subplot(1,2,1),warp(x,y,z,I); %��ͼ������ӳ�䵽Բ����
[x,y,z] = sphere(50);
subplot(1,2,2),warp(x,y,z,I); %��ͼ������ӳ�䵽����
