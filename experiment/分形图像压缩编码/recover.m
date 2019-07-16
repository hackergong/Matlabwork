%load impdata;
load lenadata4;        %datarice;          %load datarice8;        used when J=8;
N=64;
J=4;
D=2*J;
I=rand(N,N);
I1=ones(N,N);
times=10;
for t=1:times
   for i=1:J:(N-J+1)
      for j=1:J:(N-J+1)
         x=floor((i-1)/J)+1;
         y=floor((j-1)/J)+1;
   B=out(I,D,DD1(x,y),DD2(x,y));
   B1=average(B,D);
   R1=Ln(B1,J,nn(x,y));
   R1=r(x,y)*R1;
   R2=out(I1,J,DD1(x,y),DD2(x,y));
   R2=h(x,y)*R2;
   R=R1+R2;
   I=in(I,R,J,i,j);
   end
   end
end
%rice=zeros(256);
%I=mat2gray(I);
imshow(I);
%pause;
%rice1=imread('rice.tif');
%rice([1:64],[1:64])=rice1([1:64],[1:64]);

%rice([128:191],[128:191])=I([1:64],[1:64]);
%rice=mat2gray(rice);
%rice=rice1;
%imshow(rice);     %test
