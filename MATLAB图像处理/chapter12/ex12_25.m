clear all;
BW = imread('circbw.tif');
subplot(1,3,1);imshow(BW);
title('ԭʼͼ��')
lut = makelut('sum(x(:)) == 4',2);    %���ұ�
BW2 = applylut(BW,lut);               %���ұ�Ķ�ֵͼ����
subplot(1,3,2); imshow(BW2)
title('���ұ�Ķ�ֵͼ����')
B=[8 4;2 1];                %��֤2��2����
C=conv2(double(BW),B);    %�������
C=uint8(C)+1;          %ת����double���ͼ���
lut8=uint8(lut);     %ת����uint8
isize=size(C);
for i=1:isize(1)
    for j=1:isize(2);
        tmp=C(i,j);
        C(i,j)=lut8(tmp);
    end
end
C=logical(C);
isize2=size(BW2);
isizeC=size(C);
tmpsize=isizeC-isize2;
%��ȡͼ�����Ч����
C=C((tmpsize(1)+1):isizeC(1),(tmpsize(2)+1):isizeC(2));
subplot(1,3,3);imshow(C);
title('��֤ͼ��');
breturn=min(min(C==BW2));
disp(strcat('applylut����֤�����',num2str(breturn)))
