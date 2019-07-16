load woman;
subplot(221);
image(X);
colormap(map);
title('原始图像');
axis square
init=2055615866;randn('seed',init)     	%产生含噪图像
x=X+38*randn(size(X));
subplot(222);
image(x);
colormap(map);
title('含白噪声图像');
axis square;
[c,s]=wavedec2(x,2,'sym4');          	%用小波函数sym4对x进行2层小波分解
a1=wrcoef2('a',c,s,'sym4');     	%提取小波分解中第一层的低频图像
subplot(223);image(a1);
title('第一次去噪');
axis square;
a2=wrcoef2('a',c,s,'sym4',2);         	%提取小波分解中第二层的低频图像
subplot(224);
image(a2);
title('第二次去噪');
axis square;
