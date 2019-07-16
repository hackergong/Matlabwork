clear all;
data = load('points.txt');
plot(data(:,1),data(:,2),'g*')
hold on;
x = data(:,1);
y = data(:,2);
N = length(y);
d=zeros(N,1);
inliners=0;
inliners_stars=0;
epson=0.1;
ninliners_stars=0;
for i=1:100
    p_ij=ceil((rand(1,2)*N));
    p_i=data(p_ij(1),:);
    xi=p_i(1);
    yi=p_i(2);
    %plot(xi,yi,'r*')
    p_j=data(p_ij(2),:);
    xj=p_j(1);
    yj=p_j(2);
    %plot(xj,yj,'r*')
    %deduce model  Ax+By+C=0
    A=-(yj-yi);
    B=(xj-xi);
    C=(yj-yi)*xi-(xj-xi)*yi;
    for k=1:N
        xk=data(k,1);
        yk=data(k,2);
        d(k)=abs(A*xk+B*yk+C)/sqrt(A*A+B*B);
    end
    inliners=d<epson;
    plot(data(inliners,1),data(inliners,2),'g*')
    plot(x,y,'*');
    ninliners=sum(inliners);
    if ninliners>ninliners_stars  %update
            inliners_stars=inliners;
            ninliners_stars=ninliners;
    end   
end  
plot(data(inliners_stars,1),data(inliners_stars,2),'g*')
x=data(inliners_stars,1);
y=data(inliners_stars,2);
p=polyfit(x,y,1);
x=0:0.01:1;
y=p(1)*x+p(2);
p=plot(x,y);







