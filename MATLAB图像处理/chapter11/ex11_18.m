A0=imread('football.jpg');  
seed=[100,220];          	%ѡ����ʼλ��
thresh=16;            	%������ѡ����ֵ
A=rgb2gray(A0);  
A=imadjust(A,[min(min(double(A)))/255,max(max(double(A)))/255],[]);
A=double(A); 
B=A;
 [r,c]=size(B);       	%ͼ��ߴ� rΪ������cΪ����
n=r*c;            	%����ͼ����������ĸ���
pixel_seed=A(seed(1),seed(2)); 	%ԭͼ��ʼ��Ҷ�ֵ
q=[seed(1) seed(2)];    	%q����װ����ʼλ��
top=1;          	%ѭ���ж�flag
M=zeros(r,c);           	%����һ����ԭͼ��ͬ�ȴ�С�ľ���
M(seed(1),seed(2))=1;  
count=1;%������
while top~=0          	%ѭ����������
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
B(r1+i,c1+j)=1;      	%�����ж�������B�����Ӧ�ĵ㸳Ϊ1
end
if M(r1+i,c1+j)==0; 
dge=1;        	%��dge��Ϊ1
end
else
dge=1;         	%����ͼ���⽫dge��Ϊ1
end
end
end 
if dge~=1
B(r1,c1)=A(seed(1),seed(2)); 	%��ԭͼ����ʼλ�ûҶ�ֵ����B
end
if count>=n          
top=1;
end
q=q(2:top,:);
top=top-1;
end
subplot(1,2,1),
imshow(A,[]);
title('�Ҷ�ͼ��')
subplot(1,2,2),
imshow(B,[]); 
title('�������ָ�ͼ�� ')
