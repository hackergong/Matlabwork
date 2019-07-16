%中值滤波
%A层：找到一个非脉冲的中值
%A1=zmed-zmin   A2=zmed-zmax   
%B层：B1=zxy-zmin B2=zxy-zmax    如果B1>0且B2<0,输出zxy，否则输出zmed
clear all;
I=imread('lena.tif');
I=rgb2gray(I);
I_noised=imnoise(I,'salt & pepper',0.1);
figure(1);
imshow(I_noised);
I_noised1=imresize(I_noised,1);
I_noised1=double(I_noised1);
[m,n]=size(I_noised1);
smax=7;
r=((smax-1)/2);

for i=r+1:m-r
    for j=r+1:n-r
        %自适应窗口的大小
        w=3;
        while w<=smax
            wr=(w-1)/2;
            window=I_noised1(i-wr:i+wr,j-wr:j+wr);
            %将矩阵变为一列
            window=window(:);
            sw=sort(window);
            %求zmed,zmin,zmax
            zmed=median(sw);
            zmin=min(sw);
            zmax=max(sw);
            if zmed>zmin&&zmed<zmax
                break;
            else
                w=w+2;
            end
        %检测
        end    
        zxy=I_noised1(i,j);
        %B层
        if zxy>zmin&&zxy<zmax
            
            filtered_1(i,j)=zxy;
        else
            filtered_1(i,j)=zmed;
        end
    end
end
figure(2);
imshow(uint8(filtered_1))