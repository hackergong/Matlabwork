load bust
blur1=X;
blur2=X;
ff1=dct2(X); 	%��ԭͼ������ά��ɢ���ұ任
for i=1:256	%�Ա任�����Ƶ����BUTTERWORTH�˲�
for j=1:256
ff1(i,j)=ff1(i,j)/(1+((i*j+j*j)/8192)^2);
end
end
blur1=idct2(ff1); 	%�ؽ��任���ͼ��
 [c,l]=wavedec2(X,2,'db3'); 	%��ͼ����2��Ķ�άС���ֽ�
csize=size(c);
for i=1:csize(2);	%�Ե�Ƶϵ�����зŴ��������Ƹ�Ƶϵ��
if(c(i)>300)
c(i)=c(i)*2;
else
c(i)=c(i)/2;
end
end
blur2=waverec2(c,l,'db3');	%ͨ��������С��ϵ���ؽ�ͼ��
subplot(131); 	%��ʾ����ͼ��
image(wcodemat(X,192));
colormap(gray(256));
title('ԭʼͼ��');
subplot(132);
image(wcodemat(blur1,192));
colormap(gray(256));
title(' DCT�ۻ�');
subplot(133);
image(wcodemat(blur2,192));
colormap(gray(256));
title('С���ۻ�');
