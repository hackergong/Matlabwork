bw=zeros(400,400);         	%������άͼ��
bw(100,100)=1;bw(100,300)=1;
bw(300,200)=1;
d1=bwdist(bw,'euclidean');     	%����ŷ����¾���
d2=bwdist(bw,'cityblock');
d3=bwdist(bw,'chessboard');
d4=bwdist(bw,'quasi-euclidean');
subplot(2,2,1);
subimage(mat2gray(d1)); 
title('ŷ����þ��� ')
subplot(2,2,2);
subimage(mat2gray(d2)); 
title('���о��� ')
subplot(2,2,3);
subimage(mat2gray(d3)); 
title('���̾��� ')
subplot(2,2,4);
subimage(mat2gray(d4));
title('��ŷ����þ��� ')
