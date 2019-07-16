bw=zeros(80,80,80);bw(40, 40,40)=1; 	%创建三维图像
d1=bwdist(bw,'euclidean');     	%在三维图像中算算欧几里德距离变换
d2=bwdist(bw,'cityblock');
d3=bwdist(bw,'chessboard');
d4=bwdist(bw,'quasi-euclidean');
subplot(2,2,1);
isosurface(d1,15); 
title('欧几里得距离 ')
axis equal;
view(3);
subplot(2,2,2);
isosurface(d2,15); 
title('城市距离 ')
axis equal;
view(3);
camlight,lighting gouraud;
subplot(2,2,3);
isosurface(d3,15); 
title('棋盘距离 ')
axis equal;view(3);
camlight,lighting gouraud;
subplot(2,2,4);
isosurface(d4,15); 
title('类欧几里得距离 ')
axis equal;
view(3);
