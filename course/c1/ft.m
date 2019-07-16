w1=pi/3;
t=-10:0.05:10;%定义一个-10到10，间隔为0.05的变量t
f=0;
b=0;
for i=1:10000
    f=f+(2/(i*pi))*sin(i*pi/3)*cos(i*w1*t);
end
b=1/3+f
plot(t,b)