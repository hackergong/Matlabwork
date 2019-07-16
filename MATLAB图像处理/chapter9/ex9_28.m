clear all;
I=imread('coins.png');  	%读取图像
figure,
subplot(1,2,1);
imshow(I); 
title('原始图像')
I=double(I);        	%下面为利用空间域灰度级-彩色变换法对图像进行变换
[M,N]=size(I);
L=256;
for i=1:M
    for j=1:N
        if I(i,j)<=L/4;
            R(i,j)=0;
            G(i,j)=4*I(i,j);
            B(i,j)=L;
        else
            if I(i,j)<=L/2;
               R(i,j)=0;
               G(i,j)=L;
               B(i,j)=-4*I(i,j)+2*L;
            else 
                if I(i,j)<=3*L/4
                    R(i,j)=4*I(i,j)-2*L;
                    G(i,j)=L;
                    B(i,j)=0;
                else
                    R(i,j)=L;
                    G(i,j)=-4*I(i,j)+4*L;
                    B(i,j)=0;
                end
            end
        end
    end
end
 
for i=1:M
    for j=1:N
        C(i,j,1)=R(i,j);
        C(i,j,2)=G(i,j);
        C(i,j,3)=B(i,j);
    end
end
C=uint8(C);
subplot(1,2,2);
imshow(C);
title('空间域灰度级-彩色变换法的伪彩色增强')
