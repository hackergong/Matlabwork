clear all;
image_orignal=imread('QR1.png');
image_insert=imread('result.png');
image_insert=(uint8(image_orignal))
[M,N,D] = size(image_orignal);
Diff = double(image_orignal)-double(image_insert);
MSE = sum(Diff(:).^2)/numel(image_orignal);
PSNR=10*log10(255^2/MSE);

figure('name','psnr');
subplot(1,2,1)
imshow(image_orignal);
title('Ô­Í¼')
set(get(gca,'title'),'fontname','Î¢ÈíÑÅºÚ');
subplot(122)
imshow(image_insert);
title('Ë®Ó¡Í¼')
set(get(gca,'title'),'fontname','Î¢ÈíÑÅºÚ');
disp(PSNR)
 