RGB=imread('peppers.png');       	%��ȡͼ��
subplot(221),
imshow(RGB)
title('ԭʼ���ɫͼ��')
subplot(222),
imshow(RGB(:,:,1))        	%��ʼ�����ɫͼ����зֽ�
title('���ɫͼ��ĺ�ɫ����')
subplot(223),
imshow(RGB(:,:,2))
title('���ɫͼ�����ɫ����')
subplot(224),
imshow(RGB(:,:,3))
title('���ɫͼ�����ɫ����')
