f=zeros(900,900);
f(351:648,476:525)=1;
subplot(221);
imshow(f,[])
title('ԭʼͼ��');
F=fftshift(fft2(f));
subplot(222);
imshow(log(1+abs(F)),[])
title('ԭʼͼ���Ƶ��');
f=imrotate(f,45,'bilinear','crop'); 	%���������ת
subplot(223)
imshow(f,[])
title('ͼ��������ת45��')
Fc=fftshift(fft2(f));
subplot(224);
imshow(log(1+abs(Fc)),[])
title('��ת��ͼ���Ƶ��')
