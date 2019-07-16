A0=imread('football.jpg');  
seed=[100,220];          	%选择起始位置
thresh=16;            	%相似性选择阈值
A=rgb2gray(A0);  
A=imadjust(A,[min(min(double(A)))/255,max(max(double(A)))/255],[]);
A=double(A); 
B=A;
 [r,c]=size(B);       	%图像尺寸 r为行数，c为列数
n=r*c;            	%计算图像所包含点的个数
pixel_seed=A(seed(1),seed(2)); 	%原图起始点灰度值
q=[seed(1) seed(2)];    	%q用来装载起始位置
top=1;          	%循环判断flag
M=zeros(r,c);           	%建立一个与原图形同等大小的矩阵
M(seed(1),seed(2))=1;  
count=1;%计数器
while top~=0          	%循环结束条件
r1=q(1,1);  
c1=q(1,2);  
p=A(r1,c1);  
dge=0;
for i=-1:1            
for j=-1:1
if r1+i<=r && r1+i>0 && c1+j<=c && c1+j>0 
if abs(A(r1+i,c1+j)-p)<=thresh && M(r1+i,c1+j)~=1
top=top+1; 
q(top,:)=[r1+i c1+j]; 
M(r1+i,c1+j)=1;
count=count+1;
B(r1+i,c1+j)=1;      	%满足判定条件将B中相对应的点赋为1
end
if M(r1+i,c1+j)==0; 
dge=1;        	%将dge赋为1
end
else
dge=1;         	%点在图像外将dge赋为1
end
end
end 
if dge~=1
B(r1,c1)=A(seed(1),seed(2)); 	%将原图像起始位置灰度值赋予B
end
if count>=n          
top=1;
end
q=q(2:top,:);
top=top-1;
end
subplot(1,2,1),
imshow(A,[]);
title('灰度图像')
subplot(1,2,2),
imshow(B,[]); 
title('生长法分割图像 ')
