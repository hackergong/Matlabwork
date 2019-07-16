clear all;
C=magic(3);         %产生一个3×3魔方矩阵
D=ones(3);          %产生一个3×3全1矩阵
C(6,6)=0;
D(6,6)=0;
E=ifft2(fft2(C).*fft2(D));
E=E(1:5,1:5); %截取有效数据
E=real(E)
