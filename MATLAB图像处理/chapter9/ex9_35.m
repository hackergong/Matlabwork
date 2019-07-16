load bust
blur1=X;
blur2=X;
ff1=dct2(X); 	%对原图像做二维离散余弦变换
for i=1:256	%对变换结果在频域做BUTTERWORTH滤波
for j=1:256
ff1(i,j)=ff1(i,j)/(1+((i*j+j*j)/8192)^2);
end
end
blur1=idct2(ff1); 	%重建变换后的图像
 [c,l]=wavedec2(X,2,'db3'); 	%对图像做2层的二维小波分解
csize=size(c);
for i=1:csize(2);	%对低频系数进行放大处理，并抑制高频系数
if(c(i)>300)
c(i)=c(i)*2;
else
c(i)=c(i)/2;
end
end
blur2=waverec2(c,l,'db3');	%通过处理后的小波系数重建图像
subplot(131); 	%显示三幅图像
image(wcodemat(X,192));
colormap(gray(256));
title('原始图像');
subplot(132);
image(wcodemat(blur1,192));
colormap(gray(256));
title(' DCT钝化');
subplot(133);
image(wcodemat(blur2,192));
colormap(gray(256));
title('小波钝化');
