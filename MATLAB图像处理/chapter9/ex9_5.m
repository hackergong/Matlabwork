a=imread('saturn.png');
a1=imnoise(a,'gaussian',0,0.005);       	%��ԭʼͼ��Ӹ�˹����,���õ�4��ͼ��
a2=imnoise(a,'gaussian',0,0.005);
a3=imnoise(a,'gaussian',0,0.005);
a4=imnoise(a,'gaussian',0,0.005);
k=imlincomb(0.25,a1,0.25,a2,0.25,a3,0.25,a4); 		%�������
subplot(131);
imshow(a);
title('ԭʼͼ��')
subplot(132);
imshow(a1);
title('��˹����ͼ��')
subplot(133);
imshow(k,[]);
title('�������')
