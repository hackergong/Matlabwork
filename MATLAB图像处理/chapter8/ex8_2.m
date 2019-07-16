I=imread('peppers.png');
imshow(I);
title('�����������ͼ��');
pix(256)=struct('huidu',0.0,...       	%�Ҷ�ֵ
    'number',0.0,                	%��Ӧ���صĸ���
    'bianma','');                 	%��Ӧ�Ҷȵı���
[m n l]=size(I);
fid=fopen('huffman.txt','w');	%huffman.txt�ǻҶȼ�����Ӧ�ı����
fid1=fopen('huff_compara.txt','w');   	%huff_compara.txt�Ǳ����
huf_bac=cell(1,l);
for t=1:l
%��ʼ���ṹ����
    for i=1:256
        pix(i).number=1;
        pix(i).huidu=i-1;          	%�Ҷȼ���0��255�������i-1
        pix(i).bianma='';
    end
    for i=1:m                    	%ͳ��ÿ�ֻҶ����صĸ�����¼��pix������
        for j=1:n
            k=I(i,j,t)+1;            	%��ǰ�ĻҶȼ�
            pix(k).number=1+pix(k).number;
        end
    end
       for i=1:255                  	%���Ҷ����ظ����Ӵ�С����
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
count(t)=i;	%��¼ÿ��Ҷȼ�
    clear huffman    	%�����������ľ���
    huffman(num,num)=struct('huidu',0.0,...
        'number',0.0,...
        'bianma','');
    huffman(num,:)=pix(1:num);
    for i=num-1:-1:1    	%����ֵ
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
    for i=1:num-1    	%��ʼ��ÿ���Ҷ�ֵ����
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
    huf_bac(t,k)={huffman(num,k)}; 	%����
    end
 end
for t=1:l	%д���Ҷȱ����
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
                  M(i,j,t)=huf_bac{t,b}.huidu;	%���Ҷȼ��������ľ���
                   fprintf(fid1,'%s',huf_bac{t,b}.bianma);
                   fwrite(fid1,' ');	%�ÿո�ÿ���Ҷȱ������
                   break;
                 end
            end
        end
         fwrite(fid1,',');	%�ÿո�ÿ�и���
    end
      fwrite(fid1,'%');	%��%��ÿ��Ҷȼ��������
end
fclose(fid);
fclose(fid1);
M=uint8(M);
save('M')	%�洢�������
