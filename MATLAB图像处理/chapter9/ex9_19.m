I = imread('tire.tif');
[f1,f2] = freqspace(size(I),'meshgrid'); %����Ƶ�����о���
Hd = ones(size(I));   
r = sqrt(f1.^2 + f2.^2); 
Hd(r>0.1) = 0;   %�����˲���
Y=fft2(double(I));   
Y=fftshift(Y);   
Ya=Y.*Hd;   %�˲�
Ya=ifftshift(Ya);   
Ia01=ifft2(Ya);
Hd(r>0.2) = 0;   %�����˲���
Y=fft2(double(I));  
Y=fftshift(Y);   
Ya=Y.*Hd;   
Ya=ifftshift(Ya);  
Ia02=ifft2(Ya);
Hd(r>0.5) = 0;   %�����˲���
Y=fft2(double(I));  
Y=fftshift(Y); 
Ya=Y.*Hd;   
Ya=ifftshift(Ya);  
Ia05=ifft2(Ya);
subplot(2,2,1),
imshow(I),
title('ԭʼͼ��')
subplot(2,2,2),
imshow(uint8(Ia01)),
title('rΪ0.1ʱ')
subplot(2,2,3),
imshow(uint8(Ia02)),
title('rΪ0.2ʱ')
subplot(2,2,4),
imshow(uint8(Ia05)),
title('rΪ0.5ʱ')
