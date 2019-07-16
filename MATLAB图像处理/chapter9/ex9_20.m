I = imread('cell.tif');
[f1,f2] =freqspace(size(I),'meshgrid');
D=0.4;     %��ֹƵ��
n=1;
Hd = ones(size(I)); 
r = sqrt(f1.^2 + f2.^2);
for i=1:size(I,1)
    for j=1:size(I,2)
        t=r(i,j)/(D*D);
        Hd(i,j) = 1/(t^n+1);%�����˲�����
    end
end
B=fft2(double(I)); 
B=fftshift(B);
Ba=B.*Hd;
Ba=ifftshift(Ba);
Ia1=ifft2(Ba);
n=2;    
Hd = ones(size(I)); 
r = sqrt(f1.^2 + f2.^2);
for i=1:size(I,1)
    for j=1:size(I,2)
        t=r(i,j)/(D*D);
        Hd(i,j) = 1/(t^n+1);%�����˲�����
    end
end
B=fft2(double(I)); 
B=fftshift(B);%
Ba=B.*Hd;%
Ba=ifftshift(Ba);%
Ia2=ifft2(Ba);%
n=6;    
Hd = ones(size(I)); 
r = sqrt(f1.^2 + f2.^2);
for i=1:size(I,1)
    for j=1:size(I,2)
        t=r(i,j)/(D*D);
        Hd(i,j) = 1/(t^n+1);%�����˲�����
    end
end
B=fft2(double(I)); 
B=fftshift(B);
Ba=B.*Hd;
Ba=ifftshift(Ba);
Ia6=ifft2(Ba);
subplot(2,2,1),
imshow(I),
title('ԭʼͼ��');
subplot(2,2,2),
imshow(uint8(Ia1)),
title('nΪ10ʱ���˲�Ч��');
subplot(2,2,3),
imshow(uint8(Ia2)),
title('nΪ13ʱ���˲�Ч��');
subplot(2,2,4),
imshow(uint8(Ia6)),
title('nΪ18ʱ���˲�Ч��');
