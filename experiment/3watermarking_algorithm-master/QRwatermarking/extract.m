close all;
clear all;
%����ͼ��
image=imread('result.png');
%��ͼ��ĳ������
[width,high,alpha]=size(image); 
%�����λ�ã���Կ
position=[];
key=0.2;
u=4;
lenth=360;
reflect=[];

    for i=1 : width
        for j=1:high
            %��image��ÿ��λ�õ����ط��õ�һάreflect�У�����չ������
             reflect(i+width*j)=image(i,j);
        end
    end
    %16������
    k(1)=key;
    for i=1:lenth-1
        k(i+1)=u*k(i)*(1-k(i));
    end
    %�����360λÿ��λ�õ�ˮӡֵ
    for i=1 : lenth
        position(i)=fix((width*width-1)*k(i))+width;
    end
    watermarking=[];
    index=1;
    %��position�е�ֵ����һ��ֵ��i��
    for i=position
        msg_num=reflect(i);
        %����position�е�ֵ����reflect����ȡmsg_num�е�ֵ��
        msg_num=reflect(i)-'0';
       disp(reflect(i));
        %��reflect�е���ȡ����ֵ������watermarking
        watermarking(index)=msg_num;
        index=index+1;
    end
    msg=blanks(104);
    len=size(watermarking,2);
    msg=num2str(watermarking);
    %���ֵڶ����������õ�������������
    msg_bin1=strrep(msg,' ','');
    index1=1;
    msg_origin1='';
    for i=1:8:size(watermarking,2)-7
        %���������ַ���ת��Ϊ
        rgb(index1) = bin2dec(msg_bin1(i : i+7));
        msg_origin1 =native2unicode(rgb, 'UTF-8');
        index1=index1+1;
    end
    disp(msg_origin1);
        