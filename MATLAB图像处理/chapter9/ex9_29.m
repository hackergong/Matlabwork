clear all;
I=imread('coins.png');  	%��ȡͼ��
figure,
subplot(1,2,1);
imshow(I); 
title('ԭʼͼ��')
I=double(I);        	%����Ϊ���ÿռ���Ҷȼ�-��ɫ�任����ͼ����б任
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
title('�ռ���Ҷȼ�-��ɫ�任����α��ɫ��ǿ')
