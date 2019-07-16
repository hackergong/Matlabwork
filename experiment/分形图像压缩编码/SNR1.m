N=64;           %the size of image block.
J=4


lena1=imread('lena1.tif');
lena([1:64],[1:64])=lena1([108:171],[108:171]);
old=double(lena);
%rice1=imread('rice.tif');
%rice([1:64],[1:64])=rice1([1:64],[1:64]);
%old=double(rice);
%load decodedata8;     
load decodelena4;    %decodedata4;   %used   when J=4;
new=I;
ysb=J*J/5
S=0;
No=0;
for i=1:N
   for j=1:N
      S=S+old(i,j)^2;
      No=No+(new(i,j)-old(i,j))^2;
   end
end
SNR=10*log10(S/No)
