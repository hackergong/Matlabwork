clear all;
a=imread('rice.png');               
subplot(2,3,1);imshow(a);
title('ԭʼͼ��')
b1=a+50;                                %ͼ��Ҷ�ֵ����45
subplot(2,3,2);imshow(b1);
title ('�Ҷ�ֵ����')
b2=1.2*a;                                %ͼ��Աȶ�����
subplot(2,3,3);imshow(b2)
title ('�Աȶ�����')
b3=0.65*a;                                %ͼ��Աȶȼ���
subplot(2,3,4);imshow(b3);
title ('�Աȶȼ�С')
b4=-double(a)+255;        %ͼ���󲹣�ע���a������ת��Ϊdouble
subplot(2,3,5);imshow(uint8(b4));               %�ٰ�double����ת��Ϊunit8
title ('ͼ��������')
