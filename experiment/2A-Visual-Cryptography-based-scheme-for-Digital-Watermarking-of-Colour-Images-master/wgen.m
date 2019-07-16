function [ watermark ] = wgen( im,v,seed)
% Generates a matrix containing the verification information
% The function wgen() accepts the test image, the verification matrix and the
% secret pass key as input arguments. It returns the test watermark.
%imΪԭʼͼ��vΪ��ˮӡͼ��
[r,c] = size(v);
c=c/2;
vr=1;
vc=1;
[R, C]= size(im);
watermark= zeros(r,c); % ��ʼ��һ��ˮӡ���� initialization of test watermark matrix
%%
%���������
rng(seed); % passkey used as seed for random number generation
%��Կ������������ɵ�����
mat= randperm( R*C, r*c); % random number array generation
%%
for n=1:r*c % algorithm to compute test watermark
    val = mat(n);       %���ν�mat��������е�������val��CΪԭʼͼ�������
    if(mod(val,C) ==0)  %mod��val����C������
        j=C;            %������������Ϊ0����ԭͼ������C����j
    else
        j= mod(val, C); %�������Ϊ0������������j
    end
    if(val<=C)          %val�Ƿ�С�ڵ���ԭͼ������
        i=1;            
    else
        i= (val-j)/C +1;%val��ȥ�������������ټ�1
    end
    
    
    if(mod(n, c) ==0)   %�������
        wj=c;
    else
        wj= mod(n, c);  %����������wj
    end
    if(n<=c)            %���n<c����wiΪ1��
        wi=1;
    else
        wi= (n-wj)/c +1;%����Ϊ��n-wj��/c+1
    end
    
 %%   
    more=0;
    less=0;
    if(i~=1 && j~=1)    %�ж�i,j��ֵ�Ƿ����1,��������ִ�У���������ִ�������if
        if(im(i-1, j-1)<=im(i,j)) %ͼ��λ�ã�i��j����ͼ��λ�����ϽǱȽ�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=1)                     %���i��=1��ִ���������
        if(im(i-1, j)<=im(i,j)) %ͼ��λ�ã�i��j����ͼ��λ���ϲ�λ�ñȽ�
            less= less+1;           %����ֵС�ڵ�����ߣ���less+1������more+1
        else
            more=more+1;
        end
    end
    if(i~=1 && j~=C)             %���i!=1��j!=C��ִ�к�ߵ�if
        if(im(i-1, j+1)<=im(i,j))%ͼ��λ�ã�i��j��ֵ���ڵ������Ͻ�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(j~=1)                        %���j��=1��ִ��
        if(im(i, j-1)<=im(i,j))%ͼ��λ�ã�i��j��ֵ���ڵ������
            less= less+1;
        else
            more=more+1;
        end
    end
    if(j~=C)                        %���j��=C
        if(im(i, j+1)<=im(i,j))     %ͼ��λ��(i,j)ֵ���ڵ����ұ�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R && j~=1)                    %���i��=R��&&j��=1
        if(im(i+1, j-1)<=im(i,j))       %ͼ��λ�ã�i,j)ֵ���ڵ������½�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R)                            %���i��=R
        if(im(i+1, j)<=im(i,j))         %ͼ��λ�ã�i��j��ֵ���ڵ����²�
            less= less+1;
        else
            more=more+1;
        end
    end
    if(i~=R && j~=C)                    %���i��=R&&j��=C
        if(im(i+1, j+1)<=im(i,j))       %ͼ��λ�ã�i��j��ֵ���ڵ������½�
            less= less+1;
        else
            more=more+1;
        end
    end
    %% v�Ǻ�ˮӡͼ  
    %���less��С��more�ͣ���ʾ��i��j��λ�õ�ֵ�ϴ�
    %vr,vc��ʼ��Ϊ1������ʱ��vr,vc)Ϊ1���ұ�Ϊ0����ˮӡ��wi,wj)����ֵΪ1
    if((less<=more) && (v(vr,vc)==1 && v(vr,vc+1)== 0))       
        watermark(wi, wj) = 1;  
    %���less�ʹ���more�ͣ���ʾ��i��j��λ�õ�ֵ��С
    %��ʱv(vr,vc)==0��v(vr,vc+1)==1;��ˮӡ(wi,wj)����ֵΪ1
    elseif((less>more) && (v(vr,vc)==0 && v(vr,vc+1)== 1))
        watermark(wi, wj) = 1;
    %���less��С��more�ͣ���ʾ��i��j��λ�õ�ֵ�ϴ�
    %��ʱv(vr,vc)==0��v(vr,vc+1)==1����ˮӡ(wi,wj)����ֵΪ0
    elseif((less<=more )&&(v(vr, vc)==0 && v(vr, vc+1)== 1))
        watermark(wi,wj) =0;
    %���less�ʹ���more�ͣ���ʾ��i��j)λ�õ�ֵ��С
    %��ʱv(vr,vc)==1��v(vr,vc)==0����ˮӡ(wi,wj)����ֵΪ0
    elseif((less>more )&& (v(vr, vc)==1 && v(vr,vc+1)== 0))
        watermark(wi,wj) =0;
    end
    %����ɨ��ǰ���У�֮����������
    vr= vr+1;%��һ��
    if (vr == r+1)%��ʾ����r��
        vr=1;%��vr=1
        vc= vc+2;%��vc+2
    end
end  %for����

end  %��������
