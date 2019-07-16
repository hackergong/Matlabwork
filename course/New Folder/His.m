function y=His(m,n,I,c)

for i=1:m
    for j=1:n
        k=I(i,j)+1;
        c(k)=c(k)+1;
    end
end
y=c;

end