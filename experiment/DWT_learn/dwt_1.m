clear all; 
close all;
clc;
M=256;%ԭͼ�񳤶�
% N=512; %ˮӡ����
%%
% %��������ͼ��
% [filename1,pathname]=uigetfile('*.*','select the image');
%image1=imread(rgb2gray(filename1));
% image1=imread(num2str(filename1));
%%
imageo=imread('lena.tif');
image1=imageo
%%
%����ԭʼͼ��
[M,N,K]=size(image1);
figure(1);
subplot(2,2,1);
imshow(image1); 
title('original image');  % orginal image for watermarking
image1=double(image1);
%%
%����ˮӡͼ��
imagew=imread('logo3.tif');
imagew1=imresize(imagew,[128,128]);
[m,n,k]=size(imagew1);
figure(1)
subplot(2,2,2);
imshow(imagew1);
title('original watermark'); %original watermark
%%
%Ƕ��ˮӡ����
[ca,ch,cv,cd] = dwt2(image1,'db1'); %������ͼ����ж�άС���任
[cas,chs,cvs,cds] = dwt2(ca,'db1');% ��ca���ж�ά��ɢС���任

for i=1:m
    for j=1:n
        if imagew1(i,j)==0
            a=-1;
        else
            a=1;
        end
        Ca(i,j)=cas(i,j)*(1+a*0.03);
    end
end
b=[Ca,Ca,Ca];
Ca=reshape(b,128,128,3);
IM=idwt2(Ca,chs,cvs,cds,'db1');
markedimage=double(idwt2(IM,ch,cv,cd,'db1'));
markedimage=uint8(markedimage)

%��ʾǶ���ˮӡͼ��
figure(1);
subplot(2,2,3);
colormap(gray(256));
imshow(markedimage);
title('marked image');
imwrite(markedimage,gray(256),'watermarked.tif','tif');
%%
Img=imageo;
markedimage2=rgb2gray(markedimage);
Ir=Img(:,:,1);
Ig=Img(:,:,2);
Ib=Img(:,:,3);
Irx=double(Ir)./double(markedimage2);
Igx=double(Ig)./double(markedimage2);
Ibx=double(Ib)./double(markedimage2);

I12 = ((double(markedimage2)/255).^1.2);
newIr=(I12).*Irx;
newIg=(I12).*Igx;
newIb=(I12).*Ibx;
newImage=cat(3,newIr,newIg,newIb);

figure(2);
imshow(newImage,[]);title('newImage');
imwrite(newImage,'newImage.tif','tif');
%%


%%
%��ȡˮӡ
% image1=imread(num2str(filename1));
image1=double(image1);
imaged=imread('watermarked.tif');

[ca,ch,cv,cd] = dwt2(image1,'db1');

[cas,chs,cvs,cds]=dwt2(ca,'db1');

[caa,chh,cvv,cdd]=dwt2(imaged,'db1');

[caas,chhs,cvvs,cdds]=dwt2(caa,'db1');

for p=1:n
    for q=1:n
        a=caas(p,q)/cas(p,q)-1;
        if a<0
            W(p,q)=0;
        else
            W(p,q)=255;
        end
    end
end

%��ʾ��ȡ��ˮӡ
figure(1);
subplot(2,2,4);
colormap(gray(256));image(W);
title('�Ӻ�ˮӡͼ������ȡ��ˮӡ');
set(get(gca,'title'),'fontname','΢���ź�');
imwrite(W,gray(256),'watermark.bmp','bmp');

%%







