load tire
[ca1,ch1,cv1,cd1]=dwt2(X,'sym4'); 	%ʹ��sym4С�����źŽ���һ��С���ֽ�
codca1=wcodemat(ca1,192);
codch1=wcodemat(ch1,192);
codcv1=wcodemat(cv1,192);
codcd1=wcodemat(cd1,192);
codx=[codca1,codch1,codcv1,codcd1] 	%���ĸ�ϵ��ͼ�����Ϊһ��ͼ��
rca1=ca1; 	%����ԭͼ���С��ϵ��
rch1=ch1;
rcv1=cv1;
rcd1=cd1;
rch1(33:97,33:97)=zeros(65,65); 	%������ϸ��ϵ�����в�����
rcv1(33:97,33:97)=zeros(65,65);
rcd1(33:97,33:97)=zeros(65,65);
codrca1=wcodemat(rca1,192);
codrch1=wcodemat(rch1,192);
codrcv1=wcodemat(rcv1,192);
codrcd1=wcodemat(rcd1,192);
codrx=[codrca1,codrch1,codrcv1,codrcd1] 	%��������ϵ��ͼ�����Ϊһ��ͼ��
rx=idwt2(rca1,rch1,rcv1,rcd1,'sym4'); 	%�ؽ�������ϵ��
subplot(221);
image(wcodemat(X,192)),
colormap(map);
title('ԭʼͼ��');
subplot(222);
image(codx),
colormap(map);
title('һ��ֽ�����ϵ��ͼ��');
subplot(223);
image(wcodemat(rx,192)),
colormap(map);
title('ѹ��ͼ��');
subplot(224);
image(codrx),
colormap(map);
title('��������ϵ��ͼ��');
per=norm(rx)/norm(X) 	%��ѹ���źŵ������ɷ�
per =1.0000
err=norm(rx-X) 	%��ѹ���ź���ԭ�źŵı�׼��
