I=imread('eight.tif');                 % ����ͼ��
subplot(2,3,1),imshow(I);              % ��ʾԭʼͼ��
title('ԭʼͼ��');            
J=imnoise(I,'salt & pepper',0.03);     % �Ӿ�ֵΪ 0������Ϊ 0.03 �Ľ�������
subplot(2,3,2),imshow(J);              % ��ʾ������ͼ��
title('��������');    % ����ͼ�����
K = medfilt2(J,[5,5]);                            
subplot(2,3,3),imshow(K,[]);           
title('������������5*5���˲����ͼ��');          
J2=imnoise(I,'gaussian',0.03);        % �Ӿ�ֵΪ 0������Ϊ 0.03 �ĸ�˹����
subplot(2,3,4),imshow(J2);            
title('��˹����');         % ����ͼ�����
K2 = medfilt2(J2,[5,5]);             % ͼ���˲�����
subplot(2,3,5),imshow(K2,[]);         
title('��˹��������5*5���˲����ͼ��');              
