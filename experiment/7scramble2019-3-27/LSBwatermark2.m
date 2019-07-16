%% ׼�������ռ�
clc
clear all
close all
%% ��һ�� cameraman

img = imread('cameraman.tif');
imgsize=size(img);

%��ȡbitplane����ƽ��
bitPlane=zeros(imgsize(1),imgsize(2),8); %����һ��imgsize(1)�У�imgsize(2)�еľ��󣬹��˲�
for i =1:8
    for ro=1:imgsize(1)         % r  o: rowͼƬ�кţ�y
        for co=1:imgsize(2)      %co: columnͼƬ,x
        bitPlane(ro,co,i)=bitget(img(ro,co),  i);  %������������img(ro,co)��λ��i��λֵ
        end        
    end    
end
% ����bitplane   
figure('name','����ͼ��ְ˲�');
for i =1:8
    subplot(2,4,i)
    imshow(uint8(255*bitPlane(:,:,i)))
    title(['Bitplane' num2str(i)])

% set(get(gca,'title'),'fontname','΢���ź�');

end

%% �ڶ��� lena

imgW = imread('lena.jpg');
imgW=imresize(imgW,0.5);   %����ͼ���С��0.5Ϊ��ͼ����Сԭ����0.5��
imgWsize=size(imgW);
[h, w]=size(imgW);
figure('name','ԭˮӡͼ��');
imshow(imgW)
[imgs] = scramble(imgW);

%��ȡbitplane
bitPlaneW=zeros(imgWsize(1),imgWsize(2),8); 
for i =1:8
    for ro=1:imgWsize(1)
        for co=1:imgWsize(2)
        bitPlaneW(ro,co,i)=bitget(imgs(ro,co), i);
        end        
    end    
end
% ����bitplane
figure('name','ˮӡԭͼ��ֲ�');
for i =1:8
    subplot(2,4,i)
    imshow(uint8(255*bitPlaneW(:,:,i))) 
    title(['Bitplane' num2str(i)])
end

%% �����µ�bitPlane
newbitPlane=bitPlane;
newbitPlane(:,:,3) = bitPlaneW(:,:,8);    %ˮӡͼ���λ����ͼ
newbitPlane(:,:,2) = bitPlaneW(:,:,7);
newbitPlane(:,:,1) = bitPlaneW(:,:,6);
%% ������ͼƬ����ˮӡ��

newimg=zeros(256,256);
for i =1:8
    newimg=newimg+newbitPlane(:,:,i)*2^(i-1);
end
newimg=uint8(newimg);
figure('name','ˮӡͼƬ');
imshow(newimg);

%% �鿴ˮӡͼ��ԭͼ����
 figure('name','�鿴ˮӡͼ��ԭͼ����')
 subplot(1,3,1)
 imshow(img)
 title('����ͼ')
 set(get(gca,'title'),'fontname','΢���ź�');
 subplot(1,3,2)
 imshow(newimg)
 title('��ˮӡͼ')
 set(get(gca,'title'),'fontname','΢���ź�');
 dNC = nc(img,newimg);
 subplot(1,3,3)
 title(['NC=' num2str(dNC)])

%% ˮӡ��ȡ����

%��ȡbitplane
bitPlaneRec=zeros(imgWsize(1),imgWsize(2),8);   %����һ���µ�λƽ��
for i =1:8
    for ro=1:imgWsize(1)
        for co=1:imgWsize(2)
        bitPlaneRec(ro,co,i)=bitget(newimg(ro,co), i);     %��ˮӡͼ��ÿһ�㶼�ֽ⵽�µ�λƽ��
        end        
    end    
end
% ����bitplane
figure;
for i =1:8
    subplot(2,4,i)
    imshow(uint8(255*bitPlaneRec(:,:,i)))
    title(['Bitplane' num2str(i)])    
end

%% ��ԭˮӡͼ

newimgW=zeros(imgWsize(1),imgWsize(2));
for i =1:3
    newimgW=newimgW+bitPlaneRec(:,:,i)*2^(4+i);
end
for i=1:5
    newimgW=newimgW+ bitPlaneW(:,:,i+3);
end
newimgww=newimgW;
[h1,w1]=size(newimgww);
[imgr] = recover(newimgww,h1,w1);
%% ת��Ϊrgbͼ

% T=mat2gray(uint8(newimgW))
% [X,map]=gray2ind(T),
% I=ind2rgb(X,map);
% figure('name','��ȡ����ˮӡ');
% imshow(I)


%% ����ԭ��ˮӡ��ԭˮӡ����NC�Ƚ�

 figure('name','�鿴ԭˮӡ����ȡ��ˮӡNCֵ')
 subplot(1,3,1)
 imshow(imgW)
 title('ԭˮӡͼ')
 set(get(gca,'title'),'fontname','΢���ź�');
 subplot(1,3,2)
 imshow(uint8(imgr))
 title('��ȡ��ˮӡͼ')
 set(get(gca,'title'),'fontname','΢���ź�');
 dNC = nc(imgW,imgr);
 subplot(1,3,3)
 title(['NC=' num2str(dNC)])
 
 [PSNR, MSE]=psnr1(img,newimg);
 
 










