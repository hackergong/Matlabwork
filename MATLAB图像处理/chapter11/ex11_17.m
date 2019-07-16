clear all;
I=imread('tire.tif');
ZMAX=max(max(I));   %取出最大灰度值
ZMIN=min(min(I));    %取出最小灰度值
TK=(ZMAX+ZMIN)/2;
BCal=1;
iSize=size(I);  %图像的大小
while (BCal)   
         iForeground=0;  %前景数
    iBackground=0;    %定义背景数
    ForegroundSum=0; % 定义前景灰度总和
    BackgroundSum=0; % 定义背景灰度总和
    for i=1:iSize(1)
        for j=1:iSize(2)
            tmp=I(i,j);
            if(tmp>=TK)
                % 前景灰度值
                iForeground=iForeground+1;
                ForegroundSum=ForegroundSum+double(tmp);                
            else
                iBackground=iBackground+1;
                BackgroundSum=BackgroundSum+double(tmp);
            end
        end
    end
    ZO=ForegroundSum/iForeground; %计算前景的平均值
    ZB=BackgroundSum/iBackground; %计算背景的平均值
    TKTmp=uint8((ZO+ZB)/2);
    if(TKTmp==TK)
         BCal=0;
    else
        TK=TKTmp;
    end     %说明迭代结束
   end   
disp(strcat('迭代后的阈值:',num2str(TK)));
newI=im2bw(I,double(TK)/255);
subplot(1,2,1);imshow(I);
title('原始图像');
subplot(1,2,2);imshow(newI);
title('迭代法分割效果图');
