clear all;
P= zeros(200,200);  	%������ͼ��
P(25:75, 25:75) =1;
iptsetpref('ImshowAxesVisible','on')
ph = zeros(200,200);
ph (25:75, 25:75) =1;
subplot(121);imshow(ph)
title('ԭʼͼ��')
[F,Fpos,Fangles] = fanbeam(ph,250);
subplot(122);imshow(F,[],'XData',Fangles,'YData',Fpos,...
            'InitialMagnification','fit')
axis normal
xlabel('��ת�Ƕ� ') 
ylabel('������λ�� ')
title('����Radon�任')
colormap(hot), colorbar
