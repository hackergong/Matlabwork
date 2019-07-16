clear all;
img=imread('img3.tif');
[r,c,k]=size(img);
% if k==3
%     img=rgb2gray(img);
% end
% img=double(img);
subplot(1,2,1)
imshow(img);
%��ͼ��������ı任
for i=1:r
    for j=1:c
        img_1(i,j)=realpow(-1,r+c)*img(i,j);
    end
end
%��FFT2�任
img_2=fft2(img_1);

%���˲�������H(u,v)����F(u,v)
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
%����3�еĽ���ķ�DFT
img_i=ifft2(img_3);
%ȡ��һ����ʵ��
img_real=real(img_i);

%ȡ������ͼ���ϵ��
for i=1:r
    for j=1:c
        img_real_last(i,j)=realpow(-1,r+c)*img_real(i,j);
    end
end

subplot(122)
imshow(img_real_last);










