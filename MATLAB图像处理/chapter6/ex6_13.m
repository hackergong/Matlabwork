clear
i=imread('eight.tif');          	%����ͼ��
subplot(2,2,1);
imshow(i);
back=imopen(i,strel('disk',15));
subplot(2,2,2);
imshow(back);
i1=imsubtract(i,back);      	%����ͼ��ļ�������
subplot(2,2,3);
imshow(i1);
i2=imsubtract(i,45);
subplot(2,2,4);
imshow(i2);
