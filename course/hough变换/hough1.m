clear all;
data_all=load('data.txt');
% plot(data_all,'*');
theta=-pi/2:0.05:pi/2;
% x=data_all(:,1);
% y=data_all(:,2);

%%%画出hough变换图
% for i=1:140
%     r=x(i)*cos(theta)+y(i)*sin(theta);
%     figure(1);
%     hold on
%     plot(theta,r);
% end

%%%画出他们的交点图
% for j=1:10
%     r1=x(j)*cos(theta)+y(j)*sin(theta);
%     figure(2);
%     hold on;
%     plot(theta,r1);
% end

%求拟合交点
% for j=1:3
%     
%    r1=x(j)*cos(theta)+y(j)*sin(theta);
%    figure(3);
%    hold on;
%    plot(theta,r1);
%  
% end
%

%求拟合交点
L=10;
k=1;
for i=1:L-1
    xi=data_all(i,1);
    yi=data_all(i,2);
    for j=i+1:L
        xj=data_all(j,1);
        yj=data_all(j,2);
        theta_fit(k)=atan((xi-xj)/(yj-yi+eps));
        r_fit(k)=xj*cos(theta_fit)+yj*sin(theta_fit);
        k=k+1;
    end
end
count=L*(L-1)/2;
theta_fit=sum(theta_fit)/count;
r_fit=sum(r_fit)/count;


        























