clear
a=imread('pout.tif');                       	%��ȡͼ��
a1=imnoise(a,'gaussian',0,0.007);             	%��������
a2=imnoise(a,'gaussian',0,0.007); 
a3=imnoise(a,'gaussian',0,0.007);
a4=imnoise(a,'gaussian',0,0.007);
k=imlincomb(0.25,a1,0.25,a2,0.25,a3,0.25,a4);   	%�������
subplot(1,3,1);
imshow(a);
subplot(1,3,2);
imshow(a1);
subplot(1,3,3);
imshow(k);
