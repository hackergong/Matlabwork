[X,Y,Z]=peaks; %x,y��z���������peaks��������
subplot(221),
contour(Z,30)
subplot(222),contour(X,Y,Z,20);   % ����peaks��z���ά��ֵ��ͼ����ֵ�ߵ���ĿΪ20
subplot(223),      %����peaks�Ķ�ά��ֵ��ͼ����ֵ�ߵ���ĿΪ20
contour3(Z,30);
subplot(224),      % ����peaks��z����ά��ֵ��ͼ
contour3(X,Y,Z,20);    %����peaks����ά��ֵ��ͼ
