i=imread('text.png'); 	%��ȡͼ��
se=strel('line',11,90);
bw=imerode(i,se);    	%���и�ʴ����
subplot(1,2,1);
imshow(i); 
title('ԭʼͼ��') ;
subplot(1,2,2);
imshow(bw); 
title('��ֵͼ��ʴ�����') ;
