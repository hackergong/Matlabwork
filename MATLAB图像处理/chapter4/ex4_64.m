clf;
t=linspace(0,2*pi,90);
r=1-exp(-t/2).*sin(4*t);            %��תĸ��
[X,Y,Z]=cylinder(r,60);              %������ת��������
ii=find(X<0&Y<0);                 %ȷ��x-yƽ����������ϵ������±�
Z(ii)=NaN;                       %����
surf(X,Y,Z);
colormap(spring);
shading interp;
light('position',[-3,-1,3],'style','local');  %���ù�Դ
material([0.5,0.4,0.3,10,0.3]);        %���ñ��淴��
