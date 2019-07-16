%1.��������
clear all;
clc;
citys=xlsread('Chap9_citys_data.xls','Sheet1');%��excel����
save citys_data citys %����Ϊ.mat�ļ�
load citys_data.mat
%2.������м�ľ���
n=size(citys,1);%������е�����
D=zeros(n,n);%��ʼ�����븳ֵ����
for i=1:n
    for j=1:n
        if i~=j
            D(i,j)=sqrt(sum((citys(i,:)-citys(j,:)).^2));
    
            else 
            D(i,j)=1e-4;%�ú�С��ֵ����0 ��ʽ��Ҫ
        end
    end

end
%3.��ʼ������
%m=1000;%��������
m=50;
alpha=1;%��Ϣ����Ҫ�̶�����
beta=5;%����������Ҫ�̶�����
rho=0.1;%��Ϣ�ػӷ�����
Q=1;%��ϵ��
Eta=1./D;%��������
Tau=ones(n,n);%��Ϣ�ؾ���
Table=zeros(m,n);%·����¼�� M�������߹���·��
iter=1;%����������ֵ
%iter_max=500;%����������
iter_max=200;
Route_best=zeros(iter_max,n);%�������·��
Length_best=zeros(iter_max,1);%�������·���ĳ���
Length_ave=zeros(iter_max,1);%����·����ƽ������
%4.����Ѱ�����·��
while iter<=iter_max
    %��������������ϵ�������
    start=zeros(m,1);
    for i=1:m %50�����������������ʼ����λ��
        temp=randperm(n);
        start(i)=temp(1);
    end
    Table(:,1)=start;%��ʼλ��
    citys_index=1:n;%��������ȡ����
    %�������·��ѡ��
    for i=1:m
        %�������·��ѡ��
        for j=2:n  %��һֻ���ϵ�һ���Ѿ����ѡ����һ�����У���˴�2��ʼ
            tabu=Table(i,1:(j-1));%�ѷ��ʵĳ��м��ϣ����ɱ�
            allow_index=~ismember(citys_index,tabu)%û�з��ʹ��ĳ���ȡ����
            allow=citys_index(allow_index);%�����ʵĳ��м���
            P=allow;
            %������м�ת�Ƹ���
            for k=1:length(allow)
                P(k)=Tau(tabu(end),allow(k))^alpha*Eta(tabu(end),allow(k))^beta;%end�������һ��Ԫ�أ���Ӧ��ʽ
            end
            P=P/sum(P);
            %���̶ķ�ѡ����һ�����ʳ���
            Pc=cumsum(P);
            target_index=find(Pc>=rand);
            target=allow(target_index(1));
            Table(i,j)=target;%��¼����������·��ʵĳ���
        end
    end
    %����������ϵľ���·��
    Length=zeros(m,1);
    for i=1:m
        Route=Table(i,:)%ÿһ�����ϵ�·��ȡ����
        for j=1:(n-1)
            Length(i)=Length(i)+D(Route(j),Route(j+1));
        end
            Length(i)=Length(i)+D(Route(n),Route(1));
    end
    %������̾��뼰ƽ������
    if iter==1
        [min_Length,min_index]=min(Length);
        Length_best(iter)=min_Length;
        Length_ave(iter)=mean(Length);
        Route_best(iter,:)=Table(min_index,:);
    else
        [min_Length,min_index]=min(Length);
         Length_best(iter)=min(Length_best(iter-1),min_Length);
         Length_ave(iter)=mean(Length);
         if Length_best(iter)==min_Length
             Route_best(iter,:)=Table(min_index,:);
         else
             Route_best(iter,:)=Route_best((iter-1),:);
         end
    end
    %������Ϣ��
    Delta_Tau=zeros(n,n);
    %������ϼ���
    for i=1:m
        %������м���
        for j=1:(n-1)
            Delta_Tau(Table(i,j),Table(i,j+1))=Delta_Tau(Table(i,j),Table(i,j+1))+Q/Length(i);
        end
            Delta_Tau(Table(i,n),Table(i,1))=Delta_Tau(Table(i,n),Table(i,1))+Q/Length(i);
    end
    Tau=(1-rho)*Tau+Delta_Tau;
    %����������һ�����·����¼��
    iter=iter+1;
    Table=zeros(m,n);
end
%5�����ʾ
[ Shortest_Length,index]=min(Length_best);
Shortest_Route=Route_best(index,:);
disp(['��̾��룺' num2str(Shortest_Length)]);
disp(['���·����' num2str([Shortest_Route Shortest_Route(1)])]);
%6.��ͼ
figure(1)
plot([citys(Shortest_Route,1);citys(Shortest_Route(1),1)],...
    [citys(Shortest_Route,2);citys(Shortest_Route(1),2)],'o-');
grid on
for i=1:size(citys,1)
    text(citys(i,1),citys(i,2),['' num2str(i) ]);
end
text(citys(Shortest_Route(1),1),citys(Shortest_Route(1),2),' ���');
text(citys(Shortest_Route(end),1),citys(Shortest_Route(end),2),' �յ�');
xlabel('����λ�ú�����');
ylabel('����λ��������');
title(['��Ⱥ�㷨�Ż�·��(��̾���:' num2str(Shortest_Length) ')']);
figure(2)
plot(1:iter_max,Length_best,'b',1:iter_max,Length_ave,'r:');
legend('��̾���','ƽ������');
xlabel('��������');
ylabel('����');
title('������̾�����ƽ������Ա�');

