bw=zeros(80,80,80);bw(40, 40,40)=1; 	%������άͼ��
d1=bwdist(bw,'euclidean');     	%����άͼ��������ŷ����¾���任
d2=bwdist(bw,'cityblock');
d3=bwdist(bw,'chessboard');
d4=bwdist(bw,'quasi-euclidean');
subplot(2,2,1);
isosurface(d1,15); 
title('ŷ����þ��� ')
axis equal;
view(3);
subplot(2,2,2);
isosurface(d2,15); 
title('���о��� ')
axis equal;
view(3);
camlight,lighting gouraud;
subplot(2,2,3);
isosurface(d3,15); 
title('���̾��� ')
axis equal;view(3);
camlight,lighting gouraud;
subplot(2,2,4);
isosurface(d4,15); 
title('��ŷ����þ��� ')
axis equal;
view(3);
