I=imread('tape.png');
imshow(I);
title('�г̱����ͼ��');
[m n l]=size(I);
fid=fopen('yc.txt','w');          	%yc.txt���г̱���ĻҶȼ�������Ӧ�ı����
sum=0; 	%�г̱����㷨
for k=1:l 
    for i=1:m
        num=0;
         J=[];
         value=I(i,1,k);
        for j=2:n
            if I(i,j,k)==value
                num=num+1;  	%ͳ���������ػҶȼ���ȵĸ���
                if j==n
                     J=[J,num,value];
                end
            else J=[J,num,value];	%J����ʽ�����ǻҶȵĸ������ûҶȵ�ֵ
                value=I(i,j,k);
            num=1;
            end
        end
        col(i,k)=size(J,2);    	%��¼Y��ÿ���г��г̱�����
        sum=sum+col(i,k);
        Y(i,1:col(i,k),k)=J;  	%��I��ÿһ�е��г̱���J����Y����Ӧ����
    end
end

[m1,n1,l1]=size(Y);
disp('ԭͼ���С:')
whos('I');
disp('ѹ��ͼ���С:')
whos('Y');
disp('ͼ���ѹ����:');
disp(m*n*l/sum);

%������д��yc.txt��
for k=1:l1 
    for i=1:m1
        for j=1:col(i,k)
    fprintf(fid,'%d',Y(i,j,k));
     fwrite(fid,' ');
        end
    end
    fwrite(fid,' ');
end
save('Y')    
save('col')
fclose(fid);
