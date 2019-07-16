clear all��
%С���任
[I,map]=imread('lena.tif');
colormap(map);
figure(1);
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');
set(get(gca,'title'),'fontname','΢���ź�');

J=rgb2gray(I);
figure(1);
subplot(2,2,2);
imshow(J);
title('�Ҷ�ͼ��');
set(get(gca,'title'),'fontname','΢���ź�');

[cA1,cH1,cV1,cD1] = dwt2(J,'bior3.7');   

A1 = upcoef2('a',cA1,'bior3.7',1);         %bior3.7ΪС����������
H1 = upcoef2('h',cH1,'bior3.7',1);
V1 = upcoef2('v',cV1,'bior3.7',1);  
D1 = upcoef2('d',cD1,'bior3.7',1);

figure(2);
subplot(3,2,1); image(wcodemat(A1,192));    %wcodemat��չα��ɫ������ wcodemat(x,NBCODES)
                                            %wcodemat�Ծ�������������룬һ�����ֵȡ192
title('����ϵ�� A1');              %������X���±�Ϊ[1,NBCODES]��Χ�ڵ�������NBCODES��Ĭ��ֵ��16��
set(get(gca,'title'),'fontname','΢���ź�');%

figure(2);
subplot(3,2,2); 

image(wcodemat(H1,192));    
title('ˮƽϸ�� H1');
set(get(gca,'title'),'fontname','΢���ź�');

figure(2);
subplot(3,2,3); image(wcodemat(V1,192));
title('��ֱϸ�� V1');
set(get(gca,'title'),'fontname','΢���ź�');

figure(2);
subplot(3,2,4); image(wcodemat(D1,192));
title('�Խ���ϸ�� D1');
set(get(gca,'title'),'fontname','΢���ź�');


Y1=idwt2(A1,H1,V1,D1,'bior3.7');
figure(2);
subplot(3,2,5);
image(Y1);
title('һ��С���ع�ͼ��');
set(get(gca,'title'),'fontname','΢���ź�');
