load trees;
[x2,map2]=imread('forest.tif');
subplot(1,2,1),
subimage(X,map);      %��ʾ����ͼ��
colorbar
subplot(1,2,2),
subimage(x2,map2);
colorbar
