I=imread('aa.png');
switch class(I)        	%ͼ����󷴹���
case'uint8'
m=2^8-1;
I1=m - I;
case'uint16'
m=2^16-1;
I1=m-I;
case'double'
m=max(I(:));
I1=m-I;
end
figure;
subplot(1,2,1);
imshow(I);
title('ԭʼͼ��')
subplot(1,2,2);
imshow(I1);
title('ͼ��ƬЧ��');
