I= imread('tape.png');                 % ����ͼ��
subplot(2,3,1),imshow(I);              % ��ʾԭʼͼ��
title('ԭʼͼ��');            
I=rgb2gray(I);
J=imnoise(I,'salt & pepper',0.03);     % �Ӿ�ֵΪ 0������Ϊ 0.03 �Ľ�������
subplot(2,3,2),imshow(J);              % ��ʾ������ͼ��
title('��������');    % ����ͼ�����
K = wiener2 (J);                       
subplot(2,3,3),imshow(K,[]);           
title('�����������˲����ͼ��');          
J2=imnoise(I,'gaussian',0.03);        % �Ӿ�ֵΪ 0������Ϊ 0.03 �ĸ�˹����
subplot(2,3,4),imshow(J2);            
title('��˹����');         % ����ͼ�����
K2 = wiener2 (J2);                     % ͼ���˲�����
subplot(2,3,5),imshow(K2,[]);         
title('��˹�������˲����ͼ��');
