f = zeros(60,60);
f(10:48,26:34) = 1;%���ɾ���
F0 = fft2(f); 
F2 = log(abs(F0));
F = fft2(f,256,256); 
F1 = fftshift(F); 
figure;
subplot(221);
imshow(f,'InitialMagnification','fit');%�Ժ��ʴ��ڴ�С��ʾf
subplot(222);
imshow(F2,[-1 5],'InitialMagnification','fit'); %ȷ������ֵ����ʾ��Χ
subplot(223);
imshow(log(abs(F)),[-1 5]); %������ʾ����任���ͼ��
subplot(224);
imshow(log(abs(F1)),[-1 5]); %������ʾƵ�ƺ��ͼ��
