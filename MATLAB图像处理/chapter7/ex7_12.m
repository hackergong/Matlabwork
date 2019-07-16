clear all;
RGB=imread('tape.png');
I=rgb2gray(RGB);              %转化成灰度图像
figure; subplot(1,3,1),imshow(I); title('原始图像');
BW=edge(I,'sobel');
%计算
theta_step=1;
theta=0:theta_step:360;
[R,xp]=radon(BW,theta);
subplot(1,3,2),imagesc(theta,xp,R);
colormap(hot);
colorbar; title('Radon变换');
max_R=max(max(R));     
threshold=75;
[II,JJ]=find(R>=(max_R*threshold));
[line_n,d]=size(II);
subplot(1,3,3),imshow(BW); title('检验直线');
for k=1:line_n
    j=JJ(k);
    i=II(k);
    R_i=(j-1)*theta_step;
    xp_i=xp(i);
    [n,m]=size(BW);     
    x_o=m/2+(xp_i)*cos(R_i*pi/180);
    y_o=n/2-(xp_i)*sin(R_i*pi/180)+1;
    x1=1;
    xe=m;
    y1=(y_o-(x1-x_o)*tan((R_i)-90)*pi/180);
    ye=(y_o-(xe-x_o)*tan((R_i)-90)*pi/180);
    xv=[x1,xe];
    yv=[y1,ye];
    hold on;
    line(xv,yv);
    plot(x_o,y_o,':r');
end
