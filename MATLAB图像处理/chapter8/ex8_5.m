I=imread('tape.png');
imshow(I);
title('行程编码的图像');
[m n l]=size(I);
fid=fopen('yc.txt','w');          	%yc.txt是行程编码的灰度级及其相应的编码表
sum=0; 	%行程编码算法
for k=1:l 
    for i=1:m
        num=0;
         J=[];
         value=I(i,1,k);
        for j=2:n
            if I(i,j,k)==value
                num=num+1;  	%统计相邻像素灰度级相等的个数
                if j==n
                     J=[J,num,value];
                end
            else J=[J,num,value];	%J的形式是先是灰度的个数及该灰度的值
                value=I(i,j,k);
            num=1;
            end
        end
        col(i,k)=size(J,2);    	%记录Y中每行行程行程编码数
        sum=sum+col(i,k);
        Y(i,1:col(i,k),k)=J;  	%将I中每一行的行程编码J存入Y的相应行中
    end
end

[m1,n1,l1]=size(Y);
disp('原图像大小:')
whos('I');
disp('压缩图像大小:')
whos('Y');
disp('图像的压缩率:');
disp(m*n*l/sum);

%将编码写入yc.txt中
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
