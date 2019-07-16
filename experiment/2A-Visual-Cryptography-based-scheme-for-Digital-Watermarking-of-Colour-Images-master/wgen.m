function [ watermark ] = wgen( im,v,seed)
% Generates a matrix containing the verification information
% The function wgen() accepts the test image, the verification matrix and the
% secret pass key as input arguments. It returns the test watermark.
%im为原始图像，v为含水印图像
[r,c] = size(v);
c=c/2;
vr=1;
vc=1;
[R, C]= size(im);
watermark= zeros(r,c); % 初始化一个水印矩阵 initialization of test watermark matrix
%%
%产生随机数
rng(seed); % passkey used as seed for random number generation
%密钥用作随机数生成的种子
mat= randperm( R*C, r*c); % random number array generation
%%
for n=1:r*c % algorithm to compute test watermark
    val = mat(n);       %依次将mat随机矩阵中的数赋于val，C为原始图像的列数
    if(mod(val,C) ==0)  %mod求val除以C的余数
        j=C;            %如果随机数余数为0，将原图像列数C赋于j
    else
        j= mod(val, C); %随机数不为0，将余数赋于j
    end
    if(val<=C)          %val是否小于等于原图像列数
        i=1;            
    else
        i= (val-j)/C +1;%val减去余数除以列数再加1
    end
    
    
    if(mod(n, c) ==0)   %求出余数
        wj=c;
    else
        wj= mod(n, c);  %将余数赋于wj
    end
    if(n<=c)            %如果n<c，则wi为1，
        wi=1;
    else
        wi= (n-wj)/c +1;%否则为（n-wj）/c+1
    end
    
 %%   
    more=0;
    less=0;
    if(i~=1 && j~=1)    %判断i,j的值是否等于1,若等于则不执行，不等于则执行下面的if
        if(im(i-1, j-1)<=im(i,j)) %图像位置（i，j）与图像位置左上角比较
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=1)                     %如果i！=1则执行下面程序
        if(im(i-1, j)<=im(i,j)) %图像位置（i，j）与图像位置上部位置比较
            less= less+1;           %像素值小于等于左边，则less+1，否则more+1
        else
            more=more+1;
        end
    end
    if(i~=1 && j~=C)             %如果i!=1，j!=C则执行后边的if
        if(im(i-1, j+1)<=im(i,j))%图像位置（i，j）值大于等于右上角
            less= less+1;
        else
            more=more+1;
        end
    end
    if(j~=1)                        %如果j！=1则执行
        if(im(i, j-1)<=im(i,j))%图像位置（i，j）值大于等于左边
            less= less+1;
        else
            more=more+1;
        end
    end
    if(j~=C)                        %如果j！=C
        if(im(i, j+1)<=im(i,j))     %图像位置(i,j)值大于等于右边
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R && j~=1)                    %如果i！=R行&&j！=1
        if(im(i+1, j-1)<=im(i,j))       %图像位置（i,j)值大于等于左下角
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R)                            %如果i！=R
        if(im(i+1, j)<=im(i,j))         %图像位置（i，j）值大于等于下部
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R && j~=C)                    %如果i！=R&&j！=C
        if(im(i+1, j+1)<=im(i,j))       %图像位置（i，j）值大于等于右下角
            less= less+1;
        else
            more=more+1;
        end
    end
    %% v是含水印图  
    %如果less和小于more和，表示（i，j）位置的值较大
    %vr,vc初始都为1，若此时（vr,vc)为1，右边为0，则水印（wi,wj)处的值为1
    if((less<=more) && (v(vr,vc)==1 && v(vr,vc+1)== 0))       
        watermark(wi, wj) = 1;  
    %如果less和大于more和，表示（i，j）位置的值较小
    %此时v(vr,vc)==0且v(vr,vc+1)==1;则水印(wi,wj)处的值为1
    elseif((less>more) && (v(vr,vc)==0 && v(vr,vc+1)== 1))
        watermark(wi, wj) = 1;
    %如果less和小于more和，表示（i，j）位置的值较大
    %此时v(vr,vc)==0且v(vr,vc+1)==1，则水印(wi,wj)处的值为0
    elseif((less<=more )&&(v(vr, vc)==0 && v(vr, vc+1)== 1))
        watermark(wi,wj) =0;
    %如果less和大于more和，表示（i，j)位置的值较小
    %此时v(vr,vc)==1且v(vr,vc)==0，则水印(wi,wj)处的值为0
    elseif((less>more )&& (v(vr, vc)==1 && v(vr,vc+1)== 0))
        watermark(wi,wj) =0;
    end
    %首先扫描前两列，之后依次增加
    vr= vr+1;%下一行
    if (vr == r+1)%表示超出r行
        vr=1;%则vr=1
        vc= vc+2;%则vc+2
    end
end  %for结束

end  %函数结束
