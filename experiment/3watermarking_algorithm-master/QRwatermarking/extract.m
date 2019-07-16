close all;
clear all;
%读入图像
image=imread('result.png');
%求图像的长宽深度
[width,high,alpha]=size(image); 
%定义空位置，秘钥
position=[];
key=0.2;
u=4;
lenth=360;
reflect=[];

    for i=1 : width
        for j=1:high
            %将image的每个位置的像素放置到一维reflect中，并扩展了列数
             reflect(i+width*j)=image(i,j);
        end
    end
    %16个密码
    k(1)=key;
    for i=1:lenth-1
        k(i+1)=u*k(i)*(1-k(i));
    end
    %计算出360位每个位置的水印值
    for i=1 : lenth
        position(i)=fix((width*width-1)*k(i))+width;
    end
    watermarking=[];
    index=1;
    %将position中的值，逐一赋值于i。
    for i=position
        msg_num=reflect(i);
        %根据position中的值，从reflect中提取msg_num中的值。
        msg_num=reflect(i)-'0';
       disp(reflect(i));
        %将reflect中的提取出的值，赋予watermarking
        watermarking(index)=msg_num;
        index=index+1;
    end
    msg=blanks(104);
    len=size(watermarking,2);
    msg=num2str(watermarking);
    %发现第二个参数，用第三个参数代替
    msg_bin1=strrep(msg,' ','');
    index1=1;
    msg_origin1='';
    for i=1:8:size(watermarking,2)-7
        %将二进制字符串转化为
        rgb(index1) = bin2dec(msg_bin1(i : i+7));
        msg_origin1 =native2unicode(rgb, 'UTF-8');
        index1=index1+1;
    end
    disp(msg_origin1);
        