
function [imgs] = scramble(img)

% img=imread('logo.jpg');
img=rgb2gray(img);
[h w]=size(img);
subplot(121)
imshow(img,[])
title('Ë®Ó¡Í¼')
set(get(gca,'title'),'fontname','Î¢ÈíÑÅºÚ');
%ÖÃÂÒÓë¸´Ô­µÄ¹²Í¬²ÎÊı
n=25;
a=3;b=5;
N=h;

%ÖÃÂÒ
imgs=zeros(h,w);
for i=1:n
    for y=1:h
        for x=1:w           
            xx=mod((x-1)+b*(y-1),N)+1;
            yy=mod(a*(x-1)+(a*b+1)*(y-1),N)+1;        
            imgs(yy,xx)=img(y,x);                
        end
    end
    img=imgs;
end
subplot(122)
imshow(imgs,[])
title('Ë®Ó¡ÖÃÂÒÍ¼')
set(get(gca,'title'),'fontname','Î¢ÈíÑÅºÚ');

%ÖÃÂÒ
imgs=zeros(h,w);
for i=1:n
    for y=1:h
        for x=1:w           
            xx=mod((x-1)+b*(y-1),N)+1;
            yy=mod(a*(x-1)+(a*b+1)*(y-1),N)+1;        
            imgs(yy,xx)=img(y,x);                
        end
    end
%     img=imgn;
end
% subplot(121)
% imshow(imgn,[])
% title('ÖÃÂÒÍ¼')
% set(get(gca,'title'),'fontname','Î¢ÈíÑÅºÚ');

