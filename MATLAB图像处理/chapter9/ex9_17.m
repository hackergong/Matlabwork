clear all;
[I,map]=imread('trees.tif');
subplot(2,2,1);imshow(I);
title('ԭʼͼ��');
I=double(I);                    %��������ת��
[IX,IY]=gradient(I);            %�ݶ�
gm=sqrt(IX.*IX+IY.*IY);
out1=gm;
subplot(2,2,2);imshow(out1,map);
title('�ݶ�ֵ');
out2=I;
J=find(gm>=15);      %��ֵ����
out2(J)=gm(J);
subplot(2,2,3);imshow(out2,map);
title('���ݶ�ֵ����ֵ');
out3=I;
J=find(gm>=20);      %��ֵ�ڰ׻�
out3(J)=255;         %����Ϊ��ɫ
K=find(gm<20);       %��ֵ�ڰ׻�
out3(K)=0;           %����Ϊ��ɫ
subplot(2,2,4);imshow(out3,map);  
title('��ֵ������')
