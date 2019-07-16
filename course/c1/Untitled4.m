clear all;
I1=imread('fig1.jpg');
I2=imread('fig2.jpg');
[m1,n1,k1]=size(I1)
[m2,n2,k2]=size(I2)
m=max(m1,n2) %长
n=max(n1,m2) %宽
I=zeros(m,n,3)
%放置图片到I中，I1横向，I2纵向
%确定摆放初始行号
r0=round((n-m1)/2);
I(r0:r0+m1-1,:,:)=I1;
imshow(I)
r0=(n-m2)/2;
r1=r0+m2-1;
for i=1:3
I3(:,:,1)=I2(:,:,1)';
end
I(:,r0:r1,:)=I3


