clear all;

%读入图像
img=imread('lena.jpg');
[m,n,k]=size(img);
figure(1);
imshow(img)
%Step2:求概率密度p(t),第t个灰阶占整个像素的比例即为p(t).
count=zeros(1,256);
for i=1:m/2
    for j=1:n/2
        a=img(i,j);
        count(a)=count(a)+1;
    end
end
p=count/(m/2*/2)

%求颜色映射表v，将灰阶u,(u=0,1,…,255)映射为灰阶v(u),其中v(u)为与输入图像中灰阶u相关的增强后图像的灰阶。
sump=0
L=256
for t=1:L
    sump=sump+p(t);
    v(t)=floor(L*sump);
end
%扫描图像，根据灰阶映射表重写图像
img1=img;
for i=1:m
    for j=1:n
        k=img(i,j)
        img1(i,j)=v(k)
    end
end
figure(2);
imshow(uint8(img1))













