i=imread('coins.png');
A1=imregionalmin(i);  	%ȷ�����м�Сֵ
A2=imextendedmin (i,45); 	%ȷ���ֲ���Сֵ
subplot(1,3,1);
imshow(i); 
title('ԭʼͼ��') ;
subplot(1,3,2);
imshow(A1); 
title('���м�Сֵ')
subplot(1,3,3);
imshow(A2); 
title('�ֲ���Сֵ') ;
