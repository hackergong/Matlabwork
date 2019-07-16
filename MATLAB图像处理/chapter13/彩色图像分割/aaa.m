clc,clear,close all
warning off
feature jit off
im = imread('ball.jpg');
imshow(im)
greenball=im;
r = greenball(:, :, 1);
g = greenball(:, :, 2);
b = greenball(:, :, 3);

%% 计算绿色分量
Green = g - r/2 - b/2;
figure(2)
subplot(221),imshow(r); title('r')
subplot(222),imshow(g); title('g')
subplot(223),imshow(b); title('b')
subplot(224),imshow(Green);title('Green')

%%
%% 阈值二值化
bw = Green > 30; 
%% 去除小块
ball = bwareaopen(bw, 30);
figure(3)
subplot(131),imshow(ball); title('二值化图像')

r1=immultiply(r,ball);
g1=immultiply(g,ball);
b1=immultiply(b,ball);
ball2=cat(3,r1,g1,b1);
subplot(132),imshow(ball2); title('分割后的图像')

%% 找球的球心
cc=bwconncomp(ball);
s  = regionprops(ball, {'centroid','area'});
if isempty(s)
  error('没有找到球!');
else
  [~, id] = max([s.Area]);
  ball(labelmatrix(cc)~=id)=0;
end

subplot(133),imshow(ball2); title('找目标的中心')
 hold on, plot(s(id).Centroid(1),s(id).Centroid(2),'wh','MarkerSize',15,'MarkerFaceColor','r'), hold off
 disp(['Center location is (',num2str(s(id).Centroid(1),4),', ',num2str(s(id).Centroid(2),4),')'])




