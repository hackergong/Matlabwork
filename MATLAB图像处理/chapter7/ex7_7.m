f=zeros(900,900);
f(351:648,476:525)=1;
subplot(221);
imshow(f,[])
title('原始图像');
F=fftshift(fft2(f));
subplot(222);
imshow(log(1+abs(F)),[])
title('原始图像的频谱');
f=imrotate(f,45,'bilinear','crop'); 	%对其进行旋转
subplot(223)
imshow(f,[])
title('图像正向旋转45度')
Fc=fftshift(fft2(f));
subplot(224);
imshow(log(1+abs(Fc)),[])
title('旋转后图像的频谱')
