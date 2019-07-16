load spine
subplot(121);
image(X);
colormap(map);
title('原始图像');
axis square
[c,s]=wavedec2(X,2,'sym4'); 	%用小波函数sym4对X进行2层小波分解
sizec=size(c);
for i=1:sizec(2) 	%处理分解系数，突出轮廓部分，弱化细节部分。
   if(c(i)>350)
      c(i)=2*c(i);
   else
      c(i)=0.5*c(i);
   end
end
xx=waverec2(c,s,'sym4'); 	%重构处理后的系数
subplot(122);
image(xx);
colormap(map);
title('小波增强重构');
axis square
