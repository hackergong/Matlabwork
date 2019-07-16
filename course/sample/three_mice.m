clear all
pet=imread('photograph.tif');
pet=double(pet);
pet1=pet.^(0.4+0.05*i);
[m,n,~]=size(pet);
pet=zeros(m,n,3);
pet(:,:,1)=pet1;
pet(:,:,2)=pet1;
pet(:,:,3)=pet1;
tumor=imread('tumors.TIF');
tumor=double(tumor);

% RoI[1000,1300]
rgb=load('map.txt');
rgb=round(rgb*255);
rgb_len=length(rgb);
low=1000;
upper=1300;
RoI_len=upper-low+1;
coe=rgb_len/RoI_len;
[m,n,k]=size(tumor);

for i=1:m
    for j=1:n
        if tumor(i,j,:)>=low&&tumor(i,j,:)<=upper
        k=round(1+coe*(tumor(i,j,:)-low));
        end
        for depth=1:3
            pet1(i,j,depth)=rgb(k,depth);
            imshow(uint8(pet1))
        end
    end
end
imshow(uint8(pet));