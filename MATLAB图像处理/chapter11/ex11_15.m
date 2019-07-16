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
title('��ֵͼ��');
F = bwdist(~bw);
subplot(132), imshow(F,[],'InitialMagnification','fit')
title('�ָ�ǰ�ĵȸ���ͼ');
F = -F;
F(~bw) = -Inf;
%����watershed�ָ���ָ����Ա��ͼ��ʽ���
L = watershed(F);
rgb = label2rgb(L,'jet',[.6 .6 .6]);
subplot(133), imshow(rgb,'InitialMagnification','fit')
title('��ˮ��任')
