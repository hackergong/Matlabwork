load woman;          	%�����һ��ģ��ͼ��
X1=X;                         	%����
load wbarb;                	%����ڶ���ģ��ͼ��
X2=X;                     	%����
XFUS=wfusimg(X1,X2,'sym4',5,'max','max');  	%����С���ֽ��ͼ���ں�
subplot(131);
image(X1);            
colormap(map);                       	%����ɫ������ͼ
axis square;                           	%������ʾ����
title('woman');                        	%����ͼ�����
subplot(132);
image(X2);    
colormap(map);                        	%����ɫ������ͼ
axis square;                           	%������ʾ����
title('wbarb');                            	%����ͼ�����
subplot(133);
image(XFUS);                   
colormap(map); 
axis square;                           	%������ʾ����
title('�ں�ͼ��');     
