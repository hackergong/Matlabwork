RGB=imread('pears.png');
YIQ=rgb2ntsc(RGB); %将RGB模型转换到NTSC模型
figure
subplot(2,3,1);
subimage(RGB);
title('RGB图像')
subplot(2,3,2);
subimage(mat2gray(YIQ));
title('NTSC图像')
subplot(2,3,3);
subimage(mat2gray(YIQ(:,:,1)));
title('Y分量')
subplot(2,3,4);
subimage(mat2gray(YIQ(:,:,2)));
title('I分量')
subplot(2,3,5);
subimage(mat2gray(YIQ(:,:,3)));
title('Q分量')
