i=imread('rice.png');      	%��ȡͼ��
subplot(1,3,1);
imshow(i); 
title('ԭʼͼ��') ;
m1=false(size(i));
m1(64:71,64:71)=true;
j=i;
j(m1)=255;
subplot(1,3,2);
imshow(j); 
title('���ͼ���ϵĵ���') ;
k=imimposemin(i,m1);    	%���Ƽ�Сֵ
subplot(1,3,3);
imshow(k); 
title('���Ƽ�Сֵ') ;
