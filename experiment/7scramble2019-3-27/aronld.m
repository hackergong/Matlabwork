% function [] = aronld(wm)
img=imread('logo.jpg');
img=rgb2gray(img);
[h w]=size(img);
figure(1);
imshow(img);
%�����븴ԭ�Ĺ�ͬ����
n=80;
a=3;b=5;
N=h;

%����
imgn=zeros(h,w);
for i=1:n
    for y=1:h
        for x=1:w           
            xx=mod((x-1)+b*(y-1),N)+1;
            yy=mod(a*(x-1)+(a*b+1)*(y-1),N)+1;        
            imgn(yy,xx)=img(y,x);                
        end
    end
    img=imgn;
end
figure(2);
subplot(121)
imshow(imgn,[])
title('����ͼ')
set(get(gca,'title'),'fontname','΢���ź�');

%��ԭ
imgf=imgn;
for i=1:n
    for y=1:h
        for x=1:w            
            xx=mod((a*b+1)*(x-1)-b*(y-1),N)+1;
            yy=mod(-a*(x-1)+(y-1),N)+1  ;        
            imgn(yy,xx)=imgf(y,x);                   
        end
    end
    imgf=imgn;
end
figure(2);
subplot(122)
imshow(imgf,[])
title('��ԭͼ')
set(get(gca,'title'),'fontname','΢���ź�');