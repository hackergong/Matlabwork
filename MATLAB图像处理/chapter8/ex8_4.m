X=[0.46,0.36,0.16,0.18,0.16,0.15];
X=fliplr(sort(X));	%��������
[m,n]=size(X);
for i=1:n
    Y(i,1)=X(i);	%����Y�ĵ�1��
end
a=sum(Y(:,1))/2; 	%����Y��2�е�Ԫ��
for k=1:n-1
    if abs(sum(Y(1:k,1))-a)<=abs(sum(Y(1:k+1,1))-a)
        break;
    end
end
for i=1:n       	%����Y��2�е�Ԫ��
    if i<=k
        Y(i,2)=0;
    else
        Y(i,2)=1;
    end
end
END=Y(:,2)'; 	%���ɵ�һ�α���Ľ��
END=sym(END);
j=3; 	%���ɵ�3�м��Ժ��еĸ�Ԫ��
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

