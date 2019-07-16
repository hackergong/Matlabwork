function [imgr] = recover(imgn,h1,w1)
n=25;
a=3;b=5;
N=h1;
imgr=imgn;
for i=1:n
    for y=1:h1
        for x=1:w1            
            xx=mod((a*b+1)*(x-1)-b*(y-1),N)+1;
            yy=mod(-a*(x-1)+(y-1),N)+1  ;        
            imgn(yy,xx)=imgr(y,x);                   
        end
    end
   imgr=imgn;
end

figure;
imshow(imgr,[])
title('¸´Ô­Í¼')
set(get(gca,'title'),'fontname','Î¢ÈíÑÅºÚ');