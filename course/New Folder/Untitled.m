clear all;
%读取图像
I=imread('lena.tif');
IR=I(:,:,1);
IG=I(:,:,2);
IB=I(:,:,3);
[m,n,k]=size(I);
%求分布
cr=zeros(256,1);
Hr=His(m,n,I,cr);
cg=zeros(256,1);
Hg=His(m,n,I,cg);
cb=zeros(256,1);
Hb=His(m,n,I,cb);
%求C
Pr=Hr/(m*n);
Pg=Hg/(m*n);
Pb=Hb/(m*n);
Cr(1)=Pr(1);
Cg(1)=Pg(1);
Cb(1)=Pb(1);
for  i=2:256
    Cr(i)=Cr(i-1)+Pr(i);
    Cg(i)=Cg(i-1)+Pg(i);
    Cb(i)=Cb(i-1)+Pb(i);
end

%RGB
L=256*256*256;
for i=1:m
    for j=1:n
        Ri=double(I(i,j,1));
        Gi=double(I(i,j,2));
        Bi=double(I(i,j,3));
        %C(Ri,Gi,Bi)
        Crgb=Cr(Ri)*Cg(Gi)*Cb(Bi);
        %
        Co=Crgb;
        k=0;
       
        while(Co<=Crgb)
            k=k+1;
            Crgbk=Cr(Ri+k)*Cg(Gi+k)*Cb(Bi+k)/L;
            Co=Crgbk;
        end
        Inew(i,j,1)=Ri+k;
        Inew(i,j,2)=Gi+k;
        Inew(i,j,3)=Bi+k;
    end
end
imshow(Inew);
















