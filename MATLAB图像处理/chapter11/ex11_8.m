clear all;
I = imread('blobs.png');
subplot(1,3,1);imshow(I);
title('ԭʼͼ��');
rotI = imrotate(I,45,'crop');       %ͼ����ת
BW = edge(rotI,'sobel');             %��sobel������ȡͼ���еı�Ե
[H,T,R] = hough(BW);                 %��ͼ�����Hough�任
subplot(1,3,2);
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
title('hough�任');
xlabel('\theta ��'), ylabel('\rho ��');
axis on, axis normal,
hold on;
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));  %Ѱ�Ҽ�ֵ��
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7); % �ҳ���Ӧ��ֱ�߱�Ե
subplot(1,3,3);imshow(rotI), title('����߶�');
hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % ���ֱ�߱�Ե��Ӧ�����
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','blue');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
      len = norm(lines(k).point1 - lines(k).point2); % ����ֱ�߱�Ե����
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','b'); 
