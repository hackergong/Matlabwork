M=imread('aa.png');   	%��ȡͼ��
I=rgb2gray(M); 
BW1=edge(I,'sobel');     	%��Sobel���ӽ��б�Ե���
BW2=edge(I,'roberts');  	%��Roberts���ӽ��б�Ե���
BW3=edge(I,'prewitt'); 	%��prewitt���ӽ��б�Ե���
BW4=edge(I,'log');    	%��log���ӽ��б�Ե���
BW5=edge(I,'canny');  	%��canny���ӽ��б�Ե���
h=fspecial('gaussian',5); 	%��˹��ͨ�˲��� 
BW6=edge(I,'canny');   	%�˲�֮���canny���
subplot(2,3,1), 
imshow(BW1);
title('sobel ��Ե���');
subplot(2,3,2), 
imshow(BW2);
title('Roberts ��Ե���');
subplot(2,3,3), 
imshow(BW3);
title('prewitt ��Ե���');
subplot(2,3,4), 
imshow(BW4);
title('log ��Ե���');
subplot(2,3,5),
imshow(BW5);
title('canny ��Ե���');
subplot(2,3,6), 
imshow(BW6);
title('gasussian&canny ��Ե���');
