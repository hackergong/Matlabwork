load tire
init=3718025452; 	%��������
rand('seed',init);
Xnoise=X+18*(rand(size(X)));
colormap(map); 	%��ʾԭʼͼ��ͺ�������ͼ��
subplot(1,3,1);
image(wcodemat(X,192));
title('ԭʼͼ��')
axis square
subplot(1,3,2);
image(wcodemat(X,192));
title('��������ͼ��');
axis square
[c,s]=wavedec2(X,2,'sym5'); 	%��sym5С����ͼ���źŽ��ж����С���ֽ�
[thr,sorh,keepapp]=ddencmp('den','wv',Xnoise); 	%����ȥ���Ĭ����ֵ���ر�׼
[Xdenoise,cxc,lxc,perf0,perfl2]=wdencmp('gbl',c,s,'sym5',2,thr,sorh,keepapp); 
subplot(1,3,3); 	%��ʾȥ����ͼ��
image(Xdenoise);
title('ȥ����ͼ��');
axis square
