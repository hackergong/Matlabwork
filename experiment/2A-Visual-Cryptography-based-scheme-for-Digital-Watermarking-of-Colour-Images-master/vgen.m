  function [v] = vgen( im, wmk,seed )
% Generates a matrix containing the verification information
% The function vgen() accepts the image to be marked, the watermark and the
% secret pass key as input arguments. It returns the verification matrix.
%生成包含验证信息的矩阵,函数vgen()接受要标记的图像、水印和密钥作为输入参数，它返回验证矩阵。
[R, C]= size(im);%原始图像
[r, c]= size(wmk);%水印图像  
rng(seed); % pass key used as seed for random generator
%rng使得每次产生的随机数都相同

mat= randperm( R*C, r*c);   %产生r*c个R*C内的数字 
%
v= zeros(r, 2*c);   % initialization of verification matrix
vr=1; vc=1;
for n=1:r*c          %algorithm to compute verification matrix
    val = mat(n);       %将mat随机矩阵中的数依次赋于val
    if(mod(val,C) ==0)  %mod求val除以C的余数
        j=C;            %如果随机数余数为0，将原图像列数C赋于j
    else
        j= mod(val, C); %随机数不为0，将余数赋于j
    end
    
    if(val<=C)          %val是否小于等于原图像列数 
        i=1;
    else 
        i= (val-j)/C +1;    %val减去余数除以列数再加1
    end
    
    if(mod(n, c) ==0)       
        wj=c;
    else
        wj= mod(n, c);
    end
    if(n<=c)
        wi=1;
    else
        wi= (n-wj)/c +1;
    end
    %%
    more= 0;
    less= 0;
    if(i~=1 && j~=1)                    %判断i,j的值是否等于1,若等于则不执行，不等于则执行下面的if
        if(im(i-1, j-1)<=im(i,j))       %图像位置（i，j）与图像位置左上角比较
            less= less+1;               %less---小或等于就加一
        else
            more=more+1;                %more---大或等于就加一
        end
    end
    if(i~=1)
        if(im(i-1, j)<=im(i,j))         %图像位置（i，j）与图像位置上部位置比较
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=1 && j~=C)
        if(im(i-1, j+1)<=im(i,j))        %图像位置（i，j）值大于等于右上角
            less= less+1;
        else
            more=more+1;
        end
    end
    if(j~=1)
        if(im(i, j-1)<=im(i,j))           %图像位置（i，j）值大于等于左边
            less= less+1;
        else
            more=more+1;
        end
    end
    if(j~=C)
        if(im(i, j+1)<=im(i,j))           %图像位置(i,j)值大于等于右边
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R && j~=1)
        if(im(i+1, j-1)<=im(i,j))         %图像位置（i,j)值大于等于左下角
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R)
        if(im(i+1, j)<=im(i,j))           %图像位置（i，j）值大于等于下部
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R && j~=C)
        if(im(i+1, j+1)<=im(i,j))          %图像位置（i，j）值大于等于右下角
            less= less+1;
        else
            more=more+1;
        end
    end
    %%
    if(less<=more && wmk(wi, wj)==1)        % less<more,表示im(i,j)的值大，水印图(wi,wj)
        v(vr, vc:vc+1) = [1,0];             %v(vr,vc:vc+1)
    elseif(less>more && wmk(wi, wj)==1)
        v(vr, vc:vc+1) = [0,1];
    elseif(less<=more && wmk(wi, wj)==0)
        v(vr, vc:vc+1) = [0,1];
    elseif(less>more && wmk(wi, wj)==0)
        v(vr, vc:vc+1) = [1,0];
    end
    vr= vr+1;
    if(vr == r+1)
        vr=1;
        vc= vc+2;
    end
end
end
