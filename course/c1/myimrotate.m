function [ A ] = myimrotate(B,degree)                                 %定义旋转函数，degree为要旋转的角度
[r,c,d]=size(B);                                                      %获取输入图像B的行r、列c和通道数d,为了旋转彩色图像所以有必要得到通道数d
nH=round(r*abs(cosd(degree))+c*abs(sind(degree)));                    %旋转图像后得到的新高度，“round()函数四舍五入“
nW=round(c*abs(cosd(degree))+r*abs(sind(degree)));                    %旋转图像后得到的新宽度
A=zeros(nH,nW,d);                                                     %定义生成目标图像的行列以及通道数
M1=[1 0 0;0 -1 0;-0.5*nW 0.5*nH 1 ];                                  %坐标系变换矩阵M1
M2=[cosd(degree) -sind(degree) 0;sind(degree) cosd(degree) 0;0 0 1];  %角度旋转变换矩阵M2，我用的是顺时针方向
M3=[1 0 0;0 -1 0;0.5*c 0.5*r 1];                                      %坐标系变换矩阵M3
    for i=1:nW
        for j=1:nH
            temp=[i j 1]*M1*M2*M3;                                    %得到旋转后的矩阵temp
            y=temp(1,2);                                              %y取矩阵temp的第一行第二列,y对应j，为高度
            x=temp(1,1);                                              %x取矩阵temp的第一行第一列,x对应i，为宽度
            y=round(y);                                               %y四舍五入取整
            x=round(x);                                               %x四舍五入取整
           if(x>=1&&x<=c)&&(y>=1&&y<=r)                               %判断的得到的(x,y)点是否在原图像上
               A(j,i,:)=B(y,x,:);                                     %将原图像的像素点赋值给对应的旋转后图像上的点
           end                                                        %（”有人疑惑为啥不是A(i,j,:)=B(x,y,:);因为i,x对应的是列，即宽，而j,y对应的是行，即高“），我这里以x为横坐标，y为竖向纵坐标
        end
    end
end