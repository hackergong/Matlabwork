%function[]= embed(infor, key,u);
close all
clear all
img_org=imread('QR1.png');
%image=rgb2gray(img_org);
image=img_org;
 % UTF-8 encode, 'EOT' is the end tag
 %��ͳһ��ת��Ϊ���ֽ���
msg_origin = unicode2native('money123', 'UTF-8'); 
%���ַ����е�ʮ����ת��Ϊ������
msg_bin = dec2bin(msg_origin, 8);  % convert to binary
%cellstrת��Ϊ�ַ������ĵ�Ԫ���顣strjoin����Ԫ�������е��ַ�������Ϊ�����ַ���
msg = strjoin(cellstr(msg_bin)','');
%���ͼ��ĳ�����
[width,high,alpha]=size(image);
%����һ���µĿվ���
reflect=[];

for i=1 : width
    for j=1 : high
        %��image�����Ϊһ�У�����չ�˼�λ
        reflect(i+width*j)=image(i,j);
    end
end

N=size(msg,2);
position=[];
k=[];
k(1)=0.2;
u=4;

for i=1 : N-1    
    %16������
    k(i+1)=u*k(i)*(1-k(i));
end

for i=1 : N
    %fix��ʾȡ����
    position(i)=fix((width*width-1)*k(i))+width;
end
j=1;
%Ƕ��msgˮӡ��ÿһ��ֵ��ͨ���ı�positionͬλ�õ���ֵ
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

