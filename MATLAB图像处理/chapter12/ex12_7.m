IM2=imclose(IM,SE)
IM2=imclose(IM,NHOOD)
imclose������imopen�����÷������ƣ����ﲻ��׸����
��ͼ����б����㡣
i=imread('testpat1.png');   	%��ȡͼ��
subplot(1,2,1);
imshow(i); 
title('ԭʼͼ��') ;
se=strel('disk',10);
bw=imclose(i,se);    	%������
subplot(1,2,2);
imshow(bw); 
title('������') ;
