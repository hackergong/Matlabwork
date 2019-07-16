clear all;
I=imread('canoe.tif');   
subplot(221),
imshow(I);
title('ԭʼͼ��');
noisy=imnoise(I,'gaussian',0.01);      	%ԭͼ�м����˹����
[M N]=size(I);
F=fft2(noisy);
fftshift(F);
Dcut=100;
D0=250;
D1=150;
for u=1:M
    for v=1:N
        D(u,v)=sqrt(u^2+v^2);
EXPOTH(u,v)=exp(log(1/sqrt(2))*(Dcut/D(u,v))^2);	%ָ����ͨ�˲������ݺ���
        if D(u,v)<D1        	%���θ�ͨ�˲������ݺ���
            THFH(u,v)=0;
        elseif D(u,v)<=D0
            THPFH(u,v)=(D(u,v)-D1)/(D0-D1);
        else
            THPFH(u,v)=1;
        end
    end
end
EXPOTG=EXPOTH.*F;
EXPOTfiltered=ifft2(EXPOTG);
THPFG=THPFH.*F;
THPFfiltered=ifft2(THPFG);
subplot(2,2,2),
imshow(noisy)  
title('�����˹������ͼ��');
subplot(2,2,3), 
imshow(EXPOTfiltered) 
title('ָ����ͨ�˲���');
subplot(2,2,4),
imshow(THPFfiltered); 
title('���θ�ͨ�˲���');
