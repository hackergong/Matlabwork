clear all;        %清除空间变量
load cathe_1;
subplot(2,3,1);image(X);colormap(map);
title('原始图像')
axis square;             
%添加噪声
init=2055615866;
randn('seed',init);
x1=X+20*randn(size(X));
subplot(2,3,2);image(x1);colormap(map);
title('添加噪声')
axis square;             
%用小波db5对图像X进行一层小波分解
w=wpdec2(x1,1,'db5');
%重构图像近似部分
R=wprcoef(w,[1 0]);
subplot(2,3,3);image(R);colormap(map);
title('近似部分')
axis square;             
%原始图像边缘检测
W1=edge(X,'sobel');
subplot(2,3,4);imshow(W1)
title(' X的边缘')
axis square;             

%带噪声图像边缘检测
W2=edge(x1,'sobel');
subplot(2,3,5);imshow(W2)
title(' x1的边缘')
axis square;             
%图像近似部分的边缘检测
W3=edge(R,'sobel');
subplot(2,3,6);imshow(W3)
title('R边缘')
axis square;             
