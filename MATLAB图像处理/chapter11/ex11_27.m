I=imread('tire.tif');   	%��ȡͼ��
f=inline('ones(64,1)* mean(x)');	%��ͼ����п��ٷ����������
I2=colfilt(I,[8 8],'distinct',f);
subplot(1,2,1),
imshow(I,[])
title('ԭʼͼ��');
subplot(1,2,2),
imshow(I2,[])  
title('���ٷ����������');
