[X0,Y0,Z0]=sphere(45);       %������λ�������ά����
x=3*X0;                   %�����뾶Ϊ2���������ά����
y=3*Y0;
z=3*Z0;
clf,surf(X0,Y0,Z0);            %����λ����
shading interp;              %���ò岹��������
hold on
mesh(x,y,z);
colormap(hot);
hold off;                   %����hotɫ�� 
hidden off;                 %����͸��Ч��
axis equal;
axis off;                    %����ʾ������
