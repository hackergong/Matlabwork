clear all;
t=[0:0.15:24];
medium=[t,t,t]+i*[exp(-t/4),sin(3*t+3),log(1+t)];
plot(medium,'LineWidth',2);
xlabel('t');
ylabel('Y-axis');
legend('exp(-t/4)','sin(4*t+3)','log(1+t)');
