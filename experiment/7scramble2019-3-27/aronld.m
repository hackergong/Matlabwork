% function [] = aronld(wm)
img=imread('logo.jpg');
img=rgb2gray(img);
[h w]=size(img);
figure(1);
imshow(img);
%置乱与复原的共同参数
n=80;
a=3;b=5;
N=h;

%置乱
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
title('置乱图')
set(get(gca,'title'),'fontname','微软雅黑');

%复原
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
title('复原图')
set(get(gca,'title'),'fontname','微软雅黑');