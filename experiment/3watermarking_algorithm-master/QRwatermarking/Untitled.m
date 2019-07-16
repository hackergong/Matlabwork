clc
clear
close all

lambda = 0:5e-4:4;%ԭ����3:4
x = 0.4*ones(1,length(lambda));

N1 = 800;  % ǰ��ĵ�������(ԭ����400)
N2 = 200; % ����ĵ���������ԭ����100��

f = zeros(N1+N2,length(lambda));
for i = 1:N1+N2
    x = lambda .* x .* (1 - x);
    f(i,:) = x;
end
f = f(N1+1:end,:);

plot(lambda,f,'k.','MarkerSize',1)
xlabel('\lambda')
ylabel('x');
title('Logistic���ģ��-������Ŧ˵ı仯')
