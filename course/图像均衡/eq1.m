clear all;

%����ͼ��
img=imread('lena.jpg');
[m,n,k]=size(img);
figure(1);
imshow(img)
%Step2:������ܶ�p(t),��t���ҽ�ռ�������صı�����Ϊp(t).
count=zeros(1,256);
for i=1:m/2
    for j=1:n/2
        a=img(i,j);
        count(a)=count(a)+1;
    end
end
p=count/(m/2*/2)

%����ɫӳ���v�����ҽ�u,(u=0,1,��,255)ӳ��Ϊ�ҽ�v(u),����v(u)Ϊ������ͼ���лҽ�u��ص���ǿ��ͼ��Ļҽס�
sump=0
L=256
for t=1:L
    sump=sump+p(t);
    v(t)=floor(L*sump);
end
%ɨ��ͼ�񣬸��ݻҽ�ӳ�����дͼ��
img1=img;
for i=1:m
    for j=1:n
        k=img(i,j)
        img1(i,j)=v(k)
    end
end
figure(2);
imshow(uint8(img1))













