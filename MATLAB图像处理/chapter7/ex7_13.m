P= zeros(200,200);  	%������ͼ��
P(25:75, 25:75) =1;
figure(1);
subplot(2,2,1);imshow(P);
title('ԭʼͼ��')
theta1 = 0:10:170; %����3����ͬ���ֵ�radon�任
[R1,xp] = radon(P,theta1);
num_angles_R1 = size(R1,2)   %��ʾ��R1����
theta2 = 0:5:175;
[R2,xp] = radon(P,theta2);
num_angles_R2 = size(R2,2)   %��ʾ��R2����
theta3 = 0:2:178;
[R3,xp] = radon(P,theta3);
num_angles_R3 = size(R3,2)   %��ʾ��R3����
figure(2), imagesc(theta3,xp,R3)
colormap(hot)
colorbar
xlabel ('ƽ����ת�Ƕ� - \theta (degrees)');
ylabel('���д�������λ�� - x\prime (pixels)');
