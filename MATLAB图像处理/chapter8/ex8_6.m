function Y=yucebianma(x,f)
error(narginchk(1,2,nargin));
if nargin<2
    f=1;
end
x=double(x);
[m,n]=size(x);
p=zeros(m,n);
xs=x;
zc=zeros(m,1);
for j=1:length(f)
    xs=[zc,xs(:,1:end-1)];
    p=p+f(j)*xs;
end
Y=x-round(p);

function x=yucejiema(Y,f)
narginchk(1,2);
if nargin<2
    f=1;
end
f=f(end:-1:1);
[m,n]=size(Y);
odr=length(f);
f=repmat(f,m,1);
x=zeros(m,n+odr);
for j=1:n
    jj=j+odr;
    x(:,jj)=Y(:,j)+round(sum(f(:,odr:-1:1).*x(:,(jj-1):-1:(jj-odr)),2));
end
x=x(:,odr+1:end);

clear all;
X=imread('coins.png');
subplot(2,3,1);imshow(X);
title('ԭʼͼ��');
X=double(X);
Y=yucebianma(X);
XX=yucejiema(Y);
subplot(2,3,2);imshow(mat2gray(Y));
title('Ԥ�����ͼ��');
e=double(X)-double(XX);
[m,n]=size(e);
erms=sqrt(sum(e(:).^2)/(m*n));
[h,x]=hist(X(:));
subplot(2,3,3);bar(x,h,'r');
title('ԭͼ��ֱ��ͼ');
[h,x]=hist(Y(:));
subplot(2,3,4);bar(x,h,'m');
title('Ԥ�����ֱ��ͼ');
XX=uint8(XX);
subplot(2,3,5);imshow(XX);
title('����ͼ��')
whos X XX Y   
