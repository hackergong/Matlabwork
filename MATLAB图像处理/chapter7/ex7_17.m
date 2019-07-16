I1=imread('cameraman.tif'); 	%����ԭͼ�� 
subplot(131)
imshow(I1);
title('ԭʼͼ��'); 	%��ʾԭͼ�� 
I=double(I1); 
[m,n]=size(I); 
mx=max(m,n); 
wal=hadamard(mx); 	%����hadamard���� 
[f,e]=log2(n); 
I2=dec2bin(0:pow2(0.5,e)-1); 
R=bin2dec(I2(:,e-1:-1:1))+1; 	%��������ж����Ƶĵ������� 
for i=1:m 
    for j=1:n 
        wal1(i,j)=wal(i,R(j)); 
    end 
end                         
J=wal1/256*I*wal1'/256; 	%��ͼ����ж�άwalsh�任 
subplot(132)
imshow(J);
title('walsh�任'); 
K=J(1:m/2,1:n/2);  	%��ȡͼ���1/4 
K(m,n)=0;          	%��ͼ������ԭͼ���С 
R=wal1'*K*wal1;      	%��ͼ����ж�άwalsh���任 
subplot(133)
imshow(R,[]);
title('��ԭͼ��'); 
cha=I-R; 
%R1=uint8(R); 
%cha1=I1-R1; 
mse=mean(mean(cha.^2));%mse=134.41 
%mse2=mse(abs(cha1)) 
mse1=mse(cha.^2)
