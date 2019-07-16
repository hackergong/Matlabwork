clear all;
I=imread('lena.tif');
IR=I(:,:,1);
IG=I(:,:,2);
IB=I(:,:,3);
[m,n,k]=size(I);
L=256;

%%
count=zeros(1,256);
for i=1:m
    for j=1:n
        Ri=double(I(i,j,1));
        Gi=double(I(i,j,2));
        Bi=double(I(i,j,3));
        RiGiBi=(Ri+Gi+Bi)/3
        RiGiBi=round(RiGiBi)+1;%¾ùÖµ 
        count(RiGiBi)=count(RiGiBi)+1;
    end
end

%%
pdf=count/m/n;

cdf=zeros(1,L);
cdf(1)=pdf(1);
for i=2:L
    cdf(i)=cdf(i-1)+pdf(i);
end

lout=zeros(1,L);
for i=1:L
    k=round(L*cdf(i));
    if k==0
        k=1;
    end
    lout(i)=round(k);
end

for i=1:m
    for j=1:n
        Ri=double(I(i,j,1)); 
        Gi=double(I(i,j,2)); 
        Bi=double(I(i,j,3));
        CRiGiBIi=Cr(Ri+1)+Cg(Gi+1)+Cb(Bi+1);
        
        ni=round(CRiGiBi/3);
        %lout(ni);%Êä³ö²ã
        dif=lout(ni)-ni%difference 
        L_new(i,j,1)=Ri+dif;
        L_new(i,j,2)=Gi+dif;
        L_new(i,j,3)=Bi+dif;
    end  
end
       
I_new=uint(I_new);
imshow(I_new);
        
        

        
            
