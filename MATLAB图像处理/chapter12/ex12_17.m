bw= imread('circbw.tif');
bw2=bwareaopen(bw,50);    	%��ͼ�����Ƴ�СĿ��
subplot(1,2,1);
imshow(bw); 
title('ԭʼͼ��') ;
subplot(1,2,2);
imshow(bw2); 
title('�Ƴ�СĿ��') ;
