clear all;
ct1 = -9;
ct2 = -ct1;
dist = sqrt(2*(2*ct1)^2);
ra = dist/2 * 1.4;
lims = [floor(ct1-1.2*ra) ceil(ct2+1.2*ra)];
[x,y] = meshgrid(lims(1):lims(2));
bw1 = sqrt((x-ct1).^2 + (y-ct1).^2) <= ra;
bw2 = sqrt((x-ct2).^2 + (y-ct2).^2) <= ra;
bw = bw1 | bw2;
subplot(131), imshow(bw,'InitialMagnification','fit'), 
title('二值图像');
F = bwdist(~bw);
subplot(132), imshow(F,[],'InitialMagnification','fit')
title('分割前的等高线图');
F = -F;
F(~bw) = -Inf;
%进行watershed分割并将分割结果以标记图形式绘出
L = watershed(F);
rgb = label2rgb(L,'jet',[.6 .6 .6]);
subplot(133), imshow(rgb,'InitialMagnification','fit')
title('分水岭变换')
