clear all;
img=imread('img3.tif');
[r,c,k]=size(img);
% if k==3
%     img=rgb2gray(img);
% end
% img=double(img);
subplot(1,2,1)
imshow(img);
%对图像进行中心变换
for i=1:r
    for j=1:c
        img_1(i,j)=realpow(-1,r+c)*img(i,j);
    end
end
%做FFT2变换
img_2=fft2(img_1);

%用滤波器函数H(u,v)乘以F(u,v)
img_temp=ones(r,c);
%w=485;

sigma=300;
for i=1:r
    for j=1:c
        %if ((i-r/2)^2+(j-c/2)^2)<=w^2
        
           % img_3(i,j)=0;
      %  else
         %   img_3(i,j)=img_2(i,j);
         
         
        %end
        uv=((i-r/2)^2+(j-c/20^2))
        img_temp(i,j)=exp(-uv/2/sigma^2);
        
        
    end
end 
img_3=img_temp.*img_2
%计算3中的结果的反DFT
img_i=ifft2(img_3);
%取上一步的实部
img_real=real(img_i);

%取消输入图像的系数
for i=1:r
    for j=1:c
        img_real_last(i,j)=realpow(-1,r+c)*img_real(i,j);
    end
end

subplot(122)
imshow(img_real_last);










