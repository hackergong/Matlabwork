clear all
A= imread('rice.png');  	       %��ȡͼ��
subplot(121),
imshow(A)
title('ԭʼͼ��');
A=double(A);
[m,n]=size(A);
for k=1:n                  	%��ͼ������ֶ�ʲ-������任
    wht(:,k)=hadamard(m)*A(:,k)/m;
end
for j=1:m
    wh(:,j)=hadamard(n)*wht(j,:)'/n;
end
wh=wh';
subplot(122),
imshow(wh)
title('�ֶ�ʲ-������任');
