clear all;
I=imread('cell.tif');
subplot(2,2,1);imshow(I);
title('ԭʼͼ��');
I2=uint8(colfilt(I,[5,5],'sliding',@mean));        %��ͼ����л���ƽ������
subplot(2,2,2);imshow(I2);
title('����ƽ��ֵ');
I3=uint8(colfilt(I,[5,5],'sliding',@max));        %��ͼ����л������ֵ����
subplot(2,2,3);imshow(I3);
title('�������ֵ');
I4=uint8(colfilt(I,[5,5],'sliding',@min));        %��ͼ����л�����Сֵ����
subplot(2,2,4);imshow(I4);
title('������Сֵ');
