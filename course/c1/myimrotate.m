function [ A ] = myimrotate(B,degree)                                 %������ת������degreeΪҪ��ת�ĽǶ�
[r,c,d]=size(B);                                                      %��ȡ����ͼ��B����r����c��ͨ����d,Ϊ����ת��ɫͼ�������б�Ҫ�õ�ͨ����d
nH=round(r*abs(cosd(degree))+c*abs(sind(degree)));                    %��תͼ���õ����¸߶ȣ���round()�����������롰
nW=round(c*abs(cosd(degree))+r*abs(sind(degree)));                    %��תͼ���õ����¿��
A=zeros(nH,nW,d);                                                     %��������Ŀ��ͼ��������Լ�ͨ����
M1=[1 0 0;0 -1 0;-0.5*nW 0.5*nH 1 ];                                  %����ϵ�任����M1
M2=[cosd(degree) -sind(degree) 0;sind(degree) cosd(degree) 0;0 0 1];  %�Ƕ���ת�任����M2�����õ���˳ʱ�뷽��
M3=[1 0 0;0 -1 0;0.5*c 0.5*r 1];                                      %����ϵ�任����M3
    for i=1:nW
        for j=1:nH
            temp=[i j 1]*M1*M2*M3;                                    %�õ���ת��ľ���temp
            y=temp(1,2);                                              %yȡ����temp�ĵ�һ�еڶ���,y��Ӧj��Ϊ�߶�
            x=temp(1,1);                                              %xȡ����temp�ĵ�һ�е�һ��,x��Ӧi��Ϊ���
            y=round(y);                                               %y��������ȡ��
            x=round(x);                                               %x��������ȡ��
           if(x>=1&&x<=c)&&(y>=1&&y<=r)                               %�жϵĵõ���(x,y)���Ƿ���ԭͼ����
               A(j,i,:)=B(y,x,:);                                     %��ԭͼ������ص㸳ֵ����Ӧ����ת��ͼ���ϵĵ�
           end                                                        %���������ɻ�Ϊɶ����A(i,j,:)=B(x,y,:);��Ϊi,x��Ӧ�����У�������j,y��Ӧ�����У����ߡ�������������xΪ�����꣬yΪ����������
        end
    end
end