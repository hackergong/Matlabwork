clear all;
P= zeros(200,200);  	%建立简单图像
P(25:75, 25:75) =1;
iptsetpref('ImshowAxesVisible','on')
ph = zeros(200,200);
ph (25:75, 25:75) =1;
subplot(121);imshow(ph)
title('原始图像')
[F,Fpos,Fangles] = fanbeam(ph,250);
subplot(122);imshow(F,[],'XData',Fangles,'YData',Fpos,...
            'InitialMagnification','fit')
axis normal
xlabel('旋转角度 ') 
ylabel('传感器位置 ')
title('扇形Radon变换')
colormap(hot), colorbar
