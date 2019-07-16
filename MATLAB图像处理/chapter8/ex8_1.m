load woman;          	%调入第一幅模糊图像
X1=X;                         	%复制
load wbarb;                	%调入第二幅模糊图像
X2=X;                     	%复制
XFUS=wfusimg(X1,X2,'sym4',5,'max','max');  	%基于小波分解的图像融合
subplot(131);
image(X1);            
colormap(map);                       	%设置色彩索引图
axis square;                           	%设置显示比例
title('woman');                        	%设置图像标题
subplot(132);
image(X2);    
colormap(map);                        	%设置色彩索引图
axis square;                           	%设置显示比例
title('wbarb');                            	%设置图像标题
subplot(133);
image(XFUS);                   
colormap(map); 
axis square;                           	%设置显示比例
title('融合图像');     
