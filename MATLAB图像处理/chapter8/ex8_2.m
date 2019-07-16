I=imread('peppers.png');
imshow(I);
title('哈弗曼编码的图像');
pix(256)=struct('huidu',0.0,...       	%灰度值
    'number',0.0,                	%对应像素的个数
    'bianma','');                 	%对应灰度的编码
[m n l]=size(I);
fid=fopen('huffman.txt','w');	%huffman.txt是灰度级及相应的编码表
fid1=fopen('huff_compara.txt','w');   	%huff_compara.txt是编码表
huf_bac=cell(1,l);
for t=1:l
%初始化结构数组
    for i=1:256
        pix(i).number=1;
        pix(i).huidu=i-1;          	%灰度级是0—255，因此是i-1
        pix(i).bianma='';
    end
    for i=1:m                    	%统计每种灰度像素的个数记录在pix数组中
        for j=1:n
            k=I(i,j,t)+1;            	%当前的灰度级
            pix(k).number=1+pix(k).number;
        end
    end
       for i=1:255                  	%按灰度像素个数从大到小排序
        for j=i+1:256
            if  pix(i).number<pix(j).number
                temp=pix(j);
                pix(j)=pix(i);
                pix(i)=temp;
            end
        end
    end
    for i=256:-1:1
        if pix(i).number ~=0
            break;
        end
    end
    num=i;
count(t)=i;	%记录每层灰度级
    clear huffman    	%定义用于求解的矩阵
    huffman(num,num)=struct('huidu',0.0,...
        'number',0.0,...
        'bianma','');
    huffman(num,:)=pix(1:num);
    for i=num-1:-1:1    	%矩阵赋值
        p=1;
        sum=huffman(i+1,i+1).number+huffman(i+1,i).number;
        for j=1:i
            if huffman(i+1,p).number>sum
                huffman(i,j)=huffman(i+1,p);
                p=p+1;
            else
                huffman(i,j).huidu=-1;
                huffman(i,j).number=sum;
                sum=0;
               huffman(i,j+1:i)=huffman(i+1,j:i-1);
               break;
            end
        end
    end
    for i=1:num-1    	%开始给每个灰度值编码
        obj=0;
        for j=1:i
            if huffman(i,j).huidu==-1
                obj=j;
                break;
            else
                huffman(i+1,j).bianma=huffman(i,j).bianma;
            end
        end
        if huffman(i+1,i+1).number>huffman(i+1,i).number
            huffman(i+1,i+1).bianma=[huffman(i,obj).bianma '0'];
            huffman(i+1,i).bianma=[huffman(i,obj).bianma '1'];
        else
            huffman(i+1,i+1).bianma=[huffman(i,obj).bianma '1'];
            huffman(i+1,i).bianma=[huffman(i,obj).bianma '0'];
        end
        for j=obj+1:i
            huffman(i+1,j-1).bianma=huffman(i,j).bianma;
        end
    end
    for k=1:count(t)
    huf_bac(t,k)={huffman(num,k)}; 	%保存
    end
 end
for t=1:l	%写出灰度编码表
    for b=1:count(t)
    fprintf(fid,'%d',huf_bac{t,b}.huidu);
    fwrite(fid,' ');
    fprintf(fid,'%s',huf_bac{t,b}.bianma);
    fwrite(fid,' ');
    end
     fwrite(fid,'%'); 
end
for t=1:l
    for i=1:m
        for j=1:n
            for b=1:count(t)
                if I(i,j,t)==huf_bac{t,b}.huidu
                  M(i,j,t)=huf_bac{t,b}.huidu;	%将灰度级存入解码的矩阵
                   fprintf(fid1,'%s',huf_bac{t,b}.bianma);
                   fwrite(fid1,' ');	%用空格将每个灰度编码隔开
                   break;
                 end
            end
        end
         fwrite(fid1,',');	%用空格将每行隔开
    end
      fwrite(fid1,'%');	%用%将每层灰度级代码隔开
end
fclose(fid);
fclose(fid1);
M=uint8(M);
save('M')	%存储解码矩阵
