I1=imread('liftingbody.png');   	%��ȡͼ��
S=qtdecomp(I1,0.25);	%����0.25Ϊÿ����������Ҫ�ﵽ����С��ֵ
I2=full(S); 
subplot(1,2,1);
imshow(I1);         	%��ʾǰ������ͼƬ
title('ԭͼ��')
subplot(1,2,2);
imshow(I2);
title('�Ĳ����ֽ��ͼ��')
