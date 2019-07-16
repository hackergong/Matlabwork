function [PSNR, MSE]=psnr(I,K);
[M,N,D] = size(I);
Diff = double(I)-double(K);
MSE = sum(Diff(:).^2)/numel(I);
PSNR=10*log10(255^2/MSE);
figure('name','psnr');
subplot(1,2,1)
imshow(I);
title('Ô­Í¼')
set(get(gca,'title'),'fontname','Î¢ÈíÑÅºÚ');
subplot(122)
imshow(K);
title(sprintf(' PSNR: %.3f dB ', PSNR));
end