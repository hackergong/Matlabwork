clear all;
size=256;    %���峣��
block=8;
blockno=size/block;
length=size*size/64;
alpha1=0.02;
alpha2=0.1;
T1=3;
I=zeros(size,size);
D=zeros(size,size);
BW=zeros(size,size);
block_dct1=zeros(block,block);
randn('seed',10);   %������˹ˮӡ
mark=randn(1,length);
subplot(222);plot(mark);
title('��������');
I=imread('rice.png');
subplot(221);imshow(I)
title('ԭʼͼ��');
BW=edge(I,'sobel');
subplot(223);imshow(BW);
title('��Ե���');
%Ƕ��ˮӡ
k=1;
%��鴦��
for m=1:blockno
    for n=1:blockno
        %�õ���ǰ�������
        x=(m-1)*block+1;
        y=(n-1)*block+1;
        block_dct1=I(x:x+block-1,y:y+block-1);
           block_dct1=dct2(block_dct1);    % DCT�任
                BW2=BW(x:x+block-1,y:y+block-1);
        if m<=1 | n<=1
            T=0;
        else
            T=sum(BW2);
            T=sum(T);
        end
        %Ƕ��ǿ��ѡ��
        if T>T1
            alpha=alpha2;
        else
            alpha=alpha1;
        end
        %ˮӡǶ��
        block_dct1(1,1)=block_dct1(1,1)*(1+alpha*mark(k));
        block_dct1=idct2(block_dct1);
        D(x:x+block-1,y:y+block-1)=block_dct1;
        k=k+1;
    end
end
subplot(224);imshow(D,[]); %��ʾͼ��
title('Ƕ��ˮӡ')
