P= zeros(200,200);  	%建立简单图像
P(25:75, 25:75) =1;
figure(1);
subplot(2,2,1);imshow(P);
title('原始图像')
theta1 = 0:10:170; %计算3个不同部分的radon变换
[R1,xp] = radon(P,theta1);
num_angles_R1 = size(R1,2)   %显示角R1度数
theta2 = 0:5:175;
[R2,xp] = radon(P,theta2);
num_angles_R2 = size(R2,2)   %显示角R2度数
theta3 = 0:2:178;
[R3,xp] = radon(P,theta3);
num_angles_R3 = size(R3,2)   %显示角R3度数
figure(2), imagesc(theta3,xp,R3)
colormap(hot)
colorbar
xlabel ('平行旋转角度 - \theta (degrees)');
ylabel('并行传感器的位置 - x\prime (pixels)');
