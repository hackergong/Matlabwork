load spine;
subplot(121);
image(X);
colormap(map)
title('原始图像');
axis square
whos('X')      	%对图像用bior3.7小波进行2层小波分解
[c,s]=wavedec2(X,2,'bior3.7'); 	%提取小波分解结构中第一层低频系数和高频系数
ca1=appcoef2(c,s,'bior3.7',1);
ch1=detcoef2('h',c,s,1);
cv1=detcoef2('v',c,s,1);
cd1=detcoef2('d',c,s,1);  	%分别对各频率成分进行重构
a1=wrcoef2('a',c,s,'bior3.7',1);
h1=wrcoef2('h',c,s,'bior3.7',1);
v1=wrcoef2('v',c,s,'bior3.7',1);
d1=wrcoef2('d',c,s,'bior3.7',1);
c1=[a1,h1;v1,d1];       	%显示分解后各频率成分的信息
subplot(122);
image(c1);
axis square
title('分解后低频和高频信息');
