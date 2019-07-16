clear all;
pet=imread('pet.jpg');
zhou=imread('zhou1.jpg');
[mz,nz,kz]=size(zhou);
[mp,np,kp]=size(pet);

for i=1:mz
    for j=1:nz
        if zhou(i,j,:)>5
           pet(i,j,:)=zhou(i,j,:);
        end
    end
end
imshow(uint8(pet));
            


