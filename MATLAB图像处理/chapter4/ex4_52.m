clear all;
x=-5:0.5:5;
[x,y]=meshgrid(x);
z=x.^3-y.^3;
subplot(2,2,1);
surf(x,y,z);
view(38,32);
title ('�ӽ�Ϊ��38,32��')
subplot(2,2,2);
surf(x,y,z);
view(38+90,32);
title('�ӽ�Ϊ��38+90,32��')
subplot(2,2,3);
surf(x,y,z);
view(38,32+30);
title ('�ӽ�Ϊ��38,32+30��')
subplot(2,2,4);
surf(x,y,z);
view(180,0)
title('�ӽ�Ϊ��180,0')
