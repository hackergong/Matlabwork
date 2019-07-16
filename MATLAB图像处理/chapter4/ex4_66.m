clf,x=[-7:0.3:7];
y=x;
[X,Y]=meshgrid(x,y);
ZZ=X.^3-Y.^3;
ii=find(abs(X)>5|abs(Y)>5);    %确定超出[-5,5]范围的格点下标
ZZ(ii)=zeros(size(ii));          %强制为0
surf(X,Y,ZZ);
shading interp;
colormap(copper);
light('position',[0,15,1]);
lighting phong;
material([0.3 0.3 0.5 11 0.5])
