function M=in(I,B,j,k,l);
%放块操作，将2（J）+2（J）的二维子块插入全0的图中，（K，L）为子块左上角坐标。
I(k:k+j-1,l:l+j-1)=B(1:j,1:j);
M=I;
