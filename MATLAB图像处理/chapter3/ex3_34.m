RGB=imread('pears.png');
YIQ=rgb2ntsc(RGB); %��RGBģ��ת����NTSCģ��
figure
subplot(2,3,1);
subimage(RGB);
title('RGBͼ��')
subplot(2,3,2);
subimage(mat2gray(YIQ));
title('NTSCͼ��')
subplot(2,3,3);
subimage(mat2gray(YIQ(:,:,1)));
title('Y����')
subplot(2,3,4);
subimage(mat2gray(YIQ(:,:,2)));
title('I����')
subplot(2,3,5);
subimage(mat2gray(YIQ(:,:,3)));
title('Q����')
