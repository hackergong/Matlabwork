load tire
init=3718025452; 	%产生噪声
rand('seed',init);
Xnoise=X+18*(rand(size(X)));
colormap(map); 	%显示原始图像和含噪声的图像
subplot(1,3,1);
image(wcodemat(X,192));
title('原始图像')
axis square
subplot(1,3,2);
image(wcodemat(X,192));
title('含噪声的图像');
axis square
[c,s]=wavedec2(X,2,'sym5'); 	%用sym5小波对图像信号进行二层的小波分解
[thr,sorh,keepapp]=ddencmp('den','wv',Xnoise); 	%计算去噪的默认阈值和熵标准
[Xdenoise,cxc,lxc,perf0,perfl2]=wdencmp('gbl',c,s,'sym5',2,thr,sorh,keepapp); 
subplot(1,3,3); 	%显示去噪后的图像
image(Xdenoise);
title('去噪后的图像');
axis square
