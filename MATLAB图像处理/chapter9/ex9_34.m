load spine
subplot(121);
image(X);
colormap(map);
title('ԭʼͼ��');
axis square
[c,s]=wavedec2(X,2,'sym4'); 	%��С������sym4��X����2��С���ֽ�
sizec=size(c);
for i=1:sizec(2) 	%����ֽ�ϵ����ͻ���������֣�����ϸ�ڲ��֡�
   if(c(i)>350)
      c(i)=2*c(i);
   else
      c(i)=0.5*c(i);
   end
end
xx=waverec2(c,s,'sym4'); 	%�ع�������ϵ��
subplot(122);
image(xx);
colormap(map);
title('С����ǿ�ع�');
axis square
