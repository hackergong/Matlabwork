bw=imread('circbw.tif');
subplot(2,2,1);
imshow(bw); 
title('ԭʼͼ��') ;
bw2=bwmorph(bw,'remove');  	%�Ƴ��ڲ�����
subplot(2,2,2);
imshow(bw2);
title('�Ƴ��ڲ�����') ;
bw3=bwmorph(bw,'skel',Inf); 	%�Ǽ���ȡ
subplot(2,2,3);
imshow(bw3); 
title('�Ǽ���ȡ') ;
bw4=bwmorph(bw3,'spur',Inf);  	%����
subplot(2,2,4);
imshow(bw4); 
title('����') ;
