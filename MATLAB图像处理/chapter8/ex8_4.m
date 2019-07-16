X=[0.46,0.36,0.16,0.18,0.16,0.15];
X=fliplr(sort(X));	%降序排列
[m,n]=size(X);
for i=1:n
    Y(i,1)=X(i);	%生成Y的第1列
end
a=sum(Y(:,1))/2; 	%生成Y第2列的元素
for k=1:n-1
    if abs(sum(Y(1:k,1))-a)<=abs(sum(Y(1:k+1,1))-a)
        break;
    end
end
for i=1:n       	%生成Y第2列的元素
    if i<=k
        Y(i,2)=0;
    else
        Y(i,2)=1;
    end
end
END=Y(:,2)'; 	%生成第一次编码的结果
END=sym(END);
j=3; 	%生成第3列及以后几列的各元素
while (j~=0)
    p=1;
    while(p<=n)
        x=Y(p,j-1);
        for q=p:n
            if x==-1
                break;
            else
                if Y(q,j-1)==x
                    y=1;
                    continue;
                else
                    y=0;
                    break;
                end
            end
        end
       if y==1
            q=q+1;
       end
       if q==p|q-p==1
            Y(p,j)=-1;
       else
            if q-p==2
                Y(p,j)=0;
                END(p)=[char(END(p)),'0'];
                Y(q-1,j)=1;
                END(q-1)=[char(END(q-1)),'1'];
            else
                a=sum(Y(p:q-1,1))/2;
                for k=p:q-2
                    if abs(sum(Y(p:k,1))-a)<=abs(sum(Y(p:k+1,1))-a);
                            break;
                    end
                end
                    for i=p:q-1
                        if i<=k
                            Y(i,j)=0;
                            END(i)=[char(END(i)),'0'];
                        else
                            Y(i,j)=1;
                            END(i)=[char(END(i)),'1'];
                        end
                    end
            end
        end
         p=q;
    end 
    C=Y(:,j);
    D=find(C==-1);
    [e,f]=size(D);
    if e==n
        j=0;
    else
        j=j+1;
    end
end
Y
X
END
for i=1:n
    [u,v]=size(char(END(i)));
    L(i)=v;
end
avlen=sum(L.*X)

