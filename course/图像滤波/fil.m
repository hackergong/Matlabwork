clear all;
%Æ½»¬ÂË²¨Æ÷
I=imread('img2.tif');
subplot(121)
imshow(I)
I=double(uint8(I));
I=imresize(I,0.5);
[r,c,k]=size(I);

g=zeros(r,c);
p=35;
q=(p-1)/2;
t=(p-1)/2;
w=ones(p,p);
ws=sum(w(:));

for i=q+1:r-q
    for j=t+1:c-t
        for a=-q:q
            for b=-t:t
                g(i,j)=g(i,j)+w(a+q+1,b+t+1)*I(i+a,j+b);   
            end
        end
        g(i,j)=g(i,j)/ws;
    end
end
subplot(122)
imshow(uint8(g))