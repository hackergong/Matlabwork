filename=('tape.png'); 	%����ͼ��
f=imread(filename);
Info=imfinfo(filename);
if Info.BitDepth>8
   f=rgb2gray(f);
end
figure,mesh(double(f));         	%��ʾͼ�����Ƽ�ˮ���
%����1��һ���ˮ��ָ�
b=im2bw(f,graythresh(f));  	%��ֵ��,ע��Ӧ��֤��ˮ��ص�ֵ�ϵͣ�Ϊ0���������Ҫ��bȡ��
d=bwdist(b);        	%����ֵ���������ֵ�ľ��룬����ˮ��ص���ˮ��ľ���    
l=watershed(-d);           	%matlab�Դ���ˮ���㷨��l�е���ֵ��Ϊ��ˮ��
w=l==0;          	%ȡ����Ե
g=b&~w;                  	%��w��Ϊmask�Ӷ�ֵͼ����ȡֵ
figure
subplot(2,3,1),
imshow(f);
subplot(2,3,2),
imshow(b);
subplot(2,3,3),
imshow(d);
subplot(2,3,4),
imshow(l);
subplot(2,3,5),
imshow(w);
subplot(2,3,6),
imshow(g);
%����2��ʹ���ݶȵ����η�ˮ��ָ� 
h=fspecial('sobel');             	%����ݷ����sobel����
fd=double(f);
g=sqrt(imfilter(fd,h,'replicate').^2+imfilter(fd,h','replicate').^2); 
l=watershed(g);               	%��ˮ������
wr=l==0;       
g2=imclose(imopen(g,ones(3,3)),ones(3,3));	%���п��������ͼ�����ƽ��
l2=watershed(g2);           	%�ٴν��з�ˮ������
wr2=l2==0;
f2=f;
f2(wr2)=255;
figure
subplot(2,3,1),
imshow(f);
subplot(2,3,2),
imshow(g);
subplot(2,3,3),
imshow(l);
subplot(2,3,4),
imshow(g2);
subplot(2,3,5),
imshow(l2);
subplot(2,3,6),
imshow(f2);
%���н����ͼ 11 18��ʾ
%����3��ʹ���ݶȼ���ģ�����η�ˮ���㷨
h=fspecial('sobel');                   	%����ݷ����sobel����
fd=double(f);
g=sqrt(imfilter(fd,h,'replicate').^2+imfilter(fd,h','replicate').^2);
l=watershed(g);%��ˮ������
wr=l==0; 	
rm=imregionalmin(g);            	%����ͼ���������Сֵ��λ
im=imextendedmin(f,2);    	%������ǲ�����Сֵ��
fim=f;                   
fim(im)=175;              	%��im��ԭͼ�ϱ�ʶ�������Թ۲� 
lim=watershed(bwdist(im));          	%�ٴη�ˮ�����
em=lim==0;
g2=imimposemin(g,im|em);     	%���ݶ�ͼ�ϱ��im��em 
l2=watershed(g2);          	%�����η�ˮ�����
f2=f;
f2(l2==0)=255;            	%��ԭͼ�Է�ˮ����й۲�
figure
subplot(3,3,1),
imshow(f);
subplot(3,3,2),
imshow(g);
subplot(3,3,3),
imshow(l);
subplot(3,3,4),
imshow(im);
subplot(3,3,5),
imshow(fim);
subplot(3,3,6),
imshow(lim);
subplot(3,3,7),
imshow(g2);
subplot(3,3,8),
imshow(l2)
subplot(3,3,9),
imshow(f2);
%���н����ͼ 11 19��ʾ
