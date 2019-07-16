clear all
pet=imread('pet.jpg');
zhou=imread('zhou1.jpg');
zhou=zhou(:,end:-1:1,:);
% imshow(pet);
% imshow(zhou);
pet=double(pet);
zhou=double(zhou);
sp=size(pet);
sz=size(zhou);
mp=sp(1);np=sp(2);
mz=sz(1);nz=sz(2);
mI=max(mp,mz);nI=max(np,nz);
I=zeros(mI,nI,3);
for i=1:3
    I(1:mp,1:np,i)=pet(:,:,i);
    draw=zhou(:,:,i)>5;
    imshow(draw)
    I(1:mz,1:nz,i)=I(1:mz,1:nz,i).*~draw+zhou(1:mz,1:nz,i).*draw;
end
imshow(uint8(I))
