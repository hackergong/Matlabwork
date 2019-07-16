                                     %sat1=imread('saturn.tif');
%bone([1:64],[1:64])=rice([100:163],[100:163]);
%imshow(bone);
                                     %sat([1:328],[1:432])=sat1([1:328],[1:432]);
                                     %I=double(sat);
 %load testI;
rice1=imread('lena1.tif');
rice([1:64],[1:64])=rice1([1:64],[1:64]);
%rice=rice1;
%imshow(rice);     %test
I=double(rice);N=64;     %整个图像每行的像素；
M=64;
J=8;       %子块每行的像素个数；
D=2*J;  %16;      %父块每行的像素；
r=ones(N/J,M/J);   %记录对应于每个R（i，j）的r值；
h=zeros(N/J,M/J);   %记录对应于每个R（i，j）的h值；
nn=ones(N/J,M/J);  %记录对应于每个R（i，j）的仿射变换号n；
DD1=ones(N/J,M/J); %记录对应于每个R（i，j）的父块D左上角的的行号；
DD2=ones(N/J,M/J); %记录对应于每个R（i，j）的父块D左上角的列号；
R=zeros(J,J);
B=zeros(D,D);
B1=zeros(J,J);
B2=zeros(J,J);
for i=1:J:(N-J+1)
   i
for j=1:J:(M-J+1)        %第一层循环的目的是遍历所有的子块；
   e=100;
   R=out(I,J,i,j);  %用out函数从原图像I中取出一个子块R。i,j 为子块R的左上角坐标。
   x=floor((i-1)/J)+1;
   y=floor((j-1)/J)+1;
   for k=1:(N-D+1)   %test %第二层循环是针对每一子块R(i,j) 为寻找与之相仿的父块。 
   for l=1:(M-D+1)  % test%k ,l为父块的左上角坐标 
    B=out(I,D,k,l);  %取块操作，
    B1=average(B,D);  %把大小为D*D的父块通过取平均像素变为大小为J*J的子块B1
    for n=1:8         %对B1进行8种仿射变换之一得到B2。
       B2=Ln(B1,J,n);  
       [r0,h0,dp0]=rhdp(R,B2,J);
       if dp0<e
          e=dp0;
          r(x,y)=r0;      
          h(x,y)=h0;
          nn(x,y)=n;
          DD1(x,y)=k;
          DD2(x,y)=l; 
       end
                 if e<0.5  %0.05          %给定误差值0.005,如果误差小于该误差则可以不进行循，直接进行与下一个R相配的D的寻找。
                   break;
                 end
   end    %第三层循结束
              if e<0.5      %0.05
                  break;
              end
  end        %第二层循环结束。
              if e<0.5  %0.05
                 break;
              end

 end
end         %第一层循环结束
end
