clc
I=imread('coins.png');       	%��ȡͼ��
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');
[m,n]=size(I);
F=fftshift(fft2(I));
k=0.0025;
H=[];
for u=1:m 
    for  v=1:n
        q=((u-m/2)^2+(v-n/2)^2)^(5/6);
        H(u,v)=exp((-k)*q);
    end
end
G=F.*H;
I0=abs(ifft2(fftshift(G)));
subplot(2,2,2);
imshow(uint8(I0));
title('�˻���ͼ��');
I1=imnoise(uint8(I0),'gaussian',0,0.01)  	%�˻�������Ӹ�˹������ͼ��
subplot(2,2,3);
imshow(uint8(I1));
title('�˻�������Ӹ�˹������ͼ��');
F0=fftshift(fft2(I1));
F1=F0./H;
I2=ifft2(fftshift(F1));               	%���˲���ԭͼ
subplot(2,2,4);
imshow(uint8(I2));
title('���˲���ԭͼ');
