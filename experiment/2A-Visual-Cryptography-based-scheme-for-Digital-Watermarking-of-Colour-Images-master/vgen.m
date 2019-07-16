  function [v] = vgen( im, wmk,seed )
% Generates a matrix containing the verification information
% The function vgen() accepts the image to be marked, the watermark and the
% secret pass key as input arguments. It returns the verification matrix.
%���ɰ�����֤��Ϣ�ľ���,����vgen()����Ҫ��ǵ�ͼ��ˮӡ����Կ��Ϊ�����������������֤����
[R, C]= size(im);%ԭʼͼ��
[r, c]= size(wmk);%ˮӡͼ��  
rng(seed); % pass key used as seed for random generator
%rngʹ��ÿ�β��������������ͬ

mat= randperm( R*C, r*c);   %����r*c��R*C�ڵ����� 
%
v= zeros(r, 2*c);   % initialization of verification matrix
vr=1; vc=1;
for n=1:r*c          %algorithm to compute verification matrix
    val = mat(n);       %��mat��������е������θ���val
    if(mod(val,C) ==0)  %mod��val����C������
        j=C;            %������������Ϊ0����ԭͼ������C����j
    else
        j= mod(val, C); %�������Ϊ0������������j
    end
    
    if(val<=C)          %val�Ƿ�С�ڵ���ԭͼ������ 
        i=1;
    else 
        i= (val-j)/C +1;    %val��ȥ�������������ټ�1
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
    if(i~=1 && j~=1)                    %�ж�i,j��ֵ�Ƿ����1,��������ִ�У���������ִ�������if
        if(im(i-1, j-1)<=im(i,j))       %ͼ��λ�ã�i��j����ͼ��λ�����ϽǱȽ�
            less= less+1;               %less---С����ھͼ�һ
        else
            more=more+1;                %more---�����ھͼ�һ
        end
    end
    if(i~=1)
        if(im(i-1, j)<=im(i,j))         %ͼ��λ�ã�i��j����ͼ��λ���ϲ�λ�ñȽ�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=1 && j~=C)
        if(im(i-1, j+1)<=im(i,j))        %ͼ��λ�ã�i��j��ֵ���ڵ������Ͻ�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(j~=1)
        if(im(i, j-1)<=im(i,j))           %ͼ��λ�ã�i��j��ֵ���ڵ������
            less= less+1;
        else
            more=more+1;
        end
    end
    if(j~=C)
        if(im(i, j+1)<=im(i,j))           %ͼ��λ��(i,j)ֵ���ڵ����ұ�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R && j~=1)
        if(im(i+1, j-1)<=im(i,j))         %ͼ��λ�ã�i,j)ֵ���ڵ������½�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R)
        if(im(i+1, j)<=im(i,j))           %ͼ��λ�ã�i��j��ֵ���ڵ����²�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R && j~=C)
        if(im(i+1, j+1)<=im(i,j))          %ͼ��λ�ã�i��j��ֵ���ڵ������½�
            less= less+1;
        else
            more=more+1;
        end
    end
    %%
    if(less<=more && wmk(wi, wj)==1)        % less<more,��ʾim(i,j)��ֵ��ˮӡͼ(wi,wj)
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
