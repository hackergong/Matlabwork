load clown;
subplot(131);
image(X);
colormap(map);
title('原始图像');
axis square
init=2055615866; 	%产生含噪声图像
randn('seed',init)
x=X+10*randn(size(X));
subplot(132);
image(X);
colormap(map);
title('含噪声图像');
axis square
[c,s]=wavedec2(x,2,'coif3');  	%用小波画数coif3对x进行2层小波分解
n=[1,2] ;                       	%设置尺度向量n
p=[10.12,23.28];                	%设置阈值向量p
nc=wthcoef2('h',c,s,n,p,'s');
nc=wthcoef2('v',c,s,n,p,'s');
nc=wthcoef2('d',c,s,n,p,'s');
xx=waverec2(nc,s,'coif3');     	%对新的小波分解结构[nc，s]进行重构
subplot(133);
image(X);
colormap(map);
title('去噪后的图像');
axis square
