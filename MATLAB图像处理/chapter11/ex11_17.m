clear all;
I=imread('tire.tif');
ZMAX=max(max(I));   %ȡ�����Ҷ�ֵ
ZMIN=min(min(I));    %ȡ����С�Ҷ�ֵ
TK=(ZMAX+ZMIN)/2;
BCal=1;
iSize=size(I);  %ͼ��Ĵ�С
while (BCal)   
         iForeground=0;  %ǰ����
    iBackground=0;    %���屳����
    ForegroundSum=0; % ����ǰ���Ҷ��ܺ�
    BackgroundSum=0; % ���屳���Ҷ��ܺ�
    for i=1:iSize(1)
        for j=1:iSize(2)
            tmp=I(i,j);
            if(tmp>=TK)
                % ǰ���Ҷ�ֵ
                iForeground=iForeground+1;
                ForegroundSum=ForegroundSum+double(tmp);                
            else
                iBackground=iBackground+1;
                BackgroundSum=BackgroundSum+double(tmp);
            end
        end
    end
    ZO=ForegroundSum/iForeground; %����ǰ����ƽ��ֵ
    ZB=BackgroundSum/iBackground; %���㱳����ƽ��ֵ
    TKTmp=uint8((ZO+ZB)/2);
    if(TKTmp==TK)
         BCal=0;
    else
        TK=TKTmp;
    end     %˵����������
   end   
disp(strcat('���������ֵ:',num2str(TK)));
newI=im2bw(I,double(TK)/255);
subplot(1,2,1);imshow(I);
title('ԭʼͼ��');
subplot(1,2,2);imshow(newI);
title('�������ָ�Ч��ͼ');
