i=imread('circles.png'); 	%��ȡͼ��
subplot(1,2,1);
imshow(i); 
title('ԭʼͼ��') ;
se=strel('disk',7);
i0=imopen(i,se);
subplot(1,2,2);
imshow(i0);        	%������
title('������') ;
