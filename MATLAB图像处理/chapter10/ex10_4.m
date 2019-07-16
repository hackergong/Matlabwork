I=zeros(900,900);
I(351:648,476:525)=1;
noise = 0.1*randn(size(I));
PSF = fspecial('motion',21,11);   %����չ����
Blurred = imfilter(I,PSF,'circular');
BlurredNoisy = im2uint8(Blurred + noise);
NSR = sum(noise(:).^2)/sum(I(:).^2);   % ����ȵ���
NP = abs(fftn(noise)).^2; 
NPOW = sum(NP(:))/prod(size(noise));
NCORR = fftshift(real(ifftn(NP)));    %��������غ���
IP = abs(fftn(I)).^2;
IPOW = sum(IP(:))/prod(size(I));
ICORR = fftshift(real(ifftn(IP)));   %ͼ������غ���
ICORR1 = ICORR(:,ceil(size(I,1)/2));
NSR = NPOW/IPOW;   %����ȵ���
 subplot(2,2,1);imshow(BlurredNoisy,[]);
title('A = Blurred and Noisy');
subplot(2,2,2);imshow(deconvwnr(BlurredNoisy,PSF,NSR),[]);
title('deconvwnr(A,PSF,NSR)');
subplot(2,2,3);imshow(deconvwnr(BlurredNoisy,PSF,NCORR,ICORR),[]);
title('deconvwnr(A,PSF,NCORR,ICORR)');
subplot(2,2,4);imshow(deconvwnr(BlurredNoisy,PSF,NPOW,ICORR1),[]);
title('deconvwnr(A,PSF,NPOW,ICORR_1_D)');
