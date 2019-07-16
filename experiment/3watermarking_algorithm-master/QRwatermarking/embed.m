%function[]= embed(infor, key,u);
close all
clear all
img_org=imread('QR1.png');
%image=rgb2gray(img_org);
image=img_org;
 % UTF-8 encode, 'EOT' is the end tag
 %将统一码转化为数字节码
msg_origin = unicode2native('money123', 'UTF-8'); 
%将字符串中的十进制转化为二进制
msg_bin = dec2bin(msg_origin, 8);  % convert to binary
%cellstr转换为字符向量的单元数组。strjoin将单元格数组中的字符串连接为单个字符串
msg = strjoin(cellstr(msg_bin)','');
%求出图像的长宽层次
[width,high,alpha]=size(image);
%定义一个新的空矩阵
reflect=[];

for i=1 : width
    for j=1 : high
        %将image矩阵变为一行，并扩展了几位
        reflect(i+width*j)=image(i,j);
    end
end

N=size(msg,2);
position=[];
k=[];
k(1)=0.2;
u=4;

for i=1 : N-1    
    %16个密码
    k(i+1)=u*k(i)*(1-k(i));
end

for i=1 : N
    %fix表示取整数
    position(i)=fix((width*width-1)*k(i))+width;
end
j=1;
%嵌入msg水印的每一个值，通过改变position同位置的数值
for i=position
    msg_tmp=msg(j);
    reflect(i)=msg_tmp;
    disp(reflect(i));
    j=j+1;
end
for i=1 : width
    for j=1 : high
        image_end(i,j)=reflect(i+width*j);
    end
end

%imshow(uint8(image_end))
image_result = uint8(image_end);
figure(2);
imshow(image_result);
imwrite(image_result, 'result.png'); 

