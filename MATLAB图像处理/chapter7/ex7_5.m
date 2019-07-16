clear all;
f=zeros(900,900);
f(351:648,476:525)=1;
subplot(2,2,1);
imshow(f);
title('原始图像');
F=fftshift(abs(fft2(f)));
subplot(2,2,2);
imshow(F,[-1 5]);
title('原始图像频谱');
f(351:648,800:849)=1;
subplot(2,2,3);
imshow(f);
title('X轴方向移动后的图像');
F=fftshift(abs(fft2(f)));
subplot(2,2,4);
imshow(F,[-1 5]');
title('X轴方向移动后的频谱');
