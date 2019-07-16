clear all;
I=imread('lena.tif');

I=rgb2gray(I);
I=double(I);
% I=imresize(I,[1,125]);
[M,N]=size(I);

for u=1:M
    
    for v=1:M
    Fuv=0;
    for x=1:M
        for y=1:N
        Fuv=Fuv+I(x,y)*exp(-1j*2*pi*((u-1)*(x-1)/M+(v-1)*(y-1)/N));
        end
    end
    F(u,v)=Fuv/M;
    end       
end
figure;
imshow(F)

