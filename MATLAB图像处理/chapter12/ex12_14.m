bw=zeros(400,400);         	%创建二维图像
bw(100,100)=1;bw(100,300)=1;
bw(300,200)=1;
d1=bwdist(bw,'euclidean');     	%计算欧几里德距离
d2=bwdist(bw,'cityblock');
d3=bwdist(bw,'chessboard');
d4=bwdist(bw,'quasi-euclidean');
subplot(2,2,1);
subimage(mat2gray(d1)); 
title('欧几里得距离 ')
subplot(2,2,2);
subimage(mat2gray(d2)); 
title('城市距离 ')
subplot(2,2,3);
subimage(mat2gray(d3)); 
title('棋盘距离 ')
subplot(2,2,4);
subimage(mat2gray(d4));
title('类欧几里得距离 ')
