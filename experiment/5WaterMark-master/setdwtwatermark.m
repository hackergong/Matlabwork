function [Iw,psnr] = setdwtwatermark(I,W,ntimes,rngseed,flag)
%SETDWTWATERMARK ����С���任������ˮӡǶ��
%  I: ����ͼ�񣬻Ҷ�ͼ
%  W��ˮӡͼ�񣬶�ֵͼ���ҳ������
%  ntimes: ��Կ1��Arnold���Ҵ���
%  rngseed����Կ2�����������
%  flag���Ƿ���ʾͼ��0����ʾ��1��ʾ
%  Iw�������ˮӡ��Ϣ���ͼ��
%  psnr����ֵ����ȣ�Խ��˵��ˮӡ����Խ��
    
    % ��������
    type = class(I); 
    
    % ǿ��ת��Ϊdouble��logical
    I = double(I); %����ͼ�񣬻Ҷ�ͼ
    W = logical(W); %ˮӡͼ�񣬶�ֵͼ
    [mI,nI] = size(I);
    [mW,nW] = size(W);
    
    % ����Arnold����ֻ�ܶԷ�����д���
    if mW ~= nW
        error('ARNOLD����Ҫ��ˮӡͼ��ĳ��������ȣ�');
    end
    
    %% 1������ͼ�����С���ֽ�
    % һ��С���ֽ�
    % ��Ƶ��ˮƽ����ֱ���Խ�
    [ca1,ch1,cv1,cd1] = dwt2(I,'haar');
    % ����haarС���ֽ�
    [ca2,ch2,cv2,cd2] = dwt2(ca1,'haar');
    
    if flag
        figure('Name','����С���ֽ�');
        subplot(1,2,1);
        imagesc([wcodemat(ca1),wcodemat(ch1);wcodemat(cv1),wcodemat(cd1)]);
        title('һ��С���ֽ�');
        set(get(gca,'title'),'fontname','΢���ź�');
        subplot(1,2,2);
        imagesc([wcodemat(ca2),wcodemat(ch2);wcodemat(cv2),wcodemat(cd2)]);
        title('����С���ֽ�');
        set(get(gca,'title'),'fontname','΢���ź�');
    end
    
    %% 2��ˮӡͼ�����Ԥ����
    Wa = W;
    % ��ˮӡ����Arnold�任
    H = [1 1; 1 2]^ntimes; % ntimes����Կ1��Arnold�任����
    % ��Arnold���ұ任
    % H = [2 -1; -1 1]^ntimes;
    for i = 1:nW
        for j = 1:nW
            idx = mod(H*[i-1;j-1],nW)+1;
            Wa(idx(1),idx(2)) = W(i,j);
        end
    end
    
    if flag
        figure('Name','ˮӡ����Ч��');
        subplot(1,2,1);
        imshow(W);
        title('ԭʼˮӡ');
        set(get(gca,'title'),'fontname','΢���ź�');
        subplot(1,2,2);
        imshow(Wa);
        title(['����ˮӡ���任���� = ',num2str(ntimes)]);
        set(get(gca,'title'),'fontname','΢���ź�');
    end
    
    %% 3 С������ˮӡ��Ƕ��
    % ��ʼ��Ƕ��ˮӡ��ca2ϵ��
    ca2w = ca2;
    % ��ca2�����ѡ��mW*nW��ϵ��
    rng(rngseed); % rngseed����Կ2�����������
    idx = randperm(numel(ca2),numel(Wa));%����ca2��С��Wa������Wa��ˮӡͼ��
    % ��ˮӡ��ϢǶ�뵽ca2�У�numel��A����������A�е�Ԫ�ظ���
    %idxΪ����
    
    for i = 1:numel(Wa)
        % ����С��ϵ��
        c = ca2(idx(i));
        z = mod(c,nW);
        % ���ˮӡ��Ϣ
        if Wa(i) % ˮӡ��Ӧ������λ1
            if z<nW/4
                f = c - nW/4 - z;
            else
                f = c + nW*3/4 - z;
            end
        else % ˮӡ��Ӧ������λ0
            if z<nW*3/4
                f = c + nW/4 - z;
            else
                f = c + nW*5/4 - z;
            end
        end
        % Ƕ��ˮӡ���С��ϵ��
        ca2w(idx(i)) = f;
    end
    
    %% 4 ����С��ϵ���ع�ͼ��
    % haarС����任�ع�ͼ��
    ca1w = idwt2(ca2w,ch2,cv2,cd2,'haar');
    Iw = idwt2(ca1w,ch1,cv1,cd1,'haar');
    
    % ��Ҫ��ʱ�����Iwά��
    Iw = Iw(1:mI,1:nI);
    
    %% 5 ����ˮӡͼ���ֵ�����
    mn = numel(I);
    Imax = max(I(:));
    psnr = 10*log10(mn*Imax^2/sum((I(:)-Iw(:)).^2));
    
    %% 6 ���Ƕ��ˮӡ���ͼ�������
    % ת��ԭʼ��������
    I = cast(I,type);
    Iw = cast(Iw,type);
    
    if flag
        figure('Name','Ƕ��ˮӡ��ͼ��');
        subplot(1,2,1);
        imshow(I);
        title('ԭʼͼ��');
        set(get(gca,'title'),'fontname','΢���ź�');
        subplot(1,2,2);
        imshow(Iw);
        title(['���ˮӡ��PSNR = ',num2str(psnr)]);
        set(get(gca,'title'),'fontname','΢���ź�');
    end
end

