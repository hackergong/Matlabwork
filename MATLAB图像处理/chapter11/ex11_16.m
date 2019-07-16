filename=('tape.png'); 	%读入图像
f=imread(filename);
Info=imfinfo(filename);
if Info.BitDepth>8
   f=rgb2gray(f);
end
figure,mesh(double(f));         	%显示图像，类似集水盆地
%方法1：一般分水岭分割
b=im2bw(f,graythresh(f));  	%二值化,注意应保证集水盆地的值较低（为0），否则就要对b取反
d=bwdist(b);        	%求零值到最近非零值的距离，即集水盆地到分水岭的距离    
l=watershed(-d);           	%matlab自带分水岭算法，l中的零值即为风水岭
w=l==0;          	%取出边缘
g=b&~w;                  	%用w作为mask从二值图像中取值
figure
subplot(2,3,1),
imshow(f);
subplot(2,3,2),
imshow(b);
subplot(2,3,3),
imshow(d);
subplot(2,3,4),
imshow(l);
subplot(2,3,5),
imshow(w);
subplot(2,3,6),
imshow(g);
%方法2：使用梯度的两次分水岭分割 
h=fspecial('sobel');             	%获得纵方向的sobel算子
fd=double(f);
g=sqrt(imfilter(fd,h,'replicate').^2+imfilter(fd,h','replicate').^2); 
l=watershed(g);               	%分水岭运算
wr=l==0;       
g2=imclose(imopen(g,ones(3,3)),ones(3,3));	%进行开闭运算对图像进行平滑
l2=watershed(g2);           	%再次进行分水岭运算
wr2=l2==0;
f2=f;
f2(wr2)=255;
figure
subplot(2,3,1),
imshow(f);
subplot(2,3,2),
imshow(g);
subplot(2,3,3),
imshow(l);
subplot(2,3,4),
imshow(g2);
subplot(2,3,5),
imshow(l2);
subplot(2,3,6),
imshow(f2);
%运行结果如图 11 18所示
%方法3：使用梯度加掩模的三次分水岭算法
h=fspecial('sobel');                   	%获得纵方向的sobel算子
fd=double(f);
g=sqrt(imfilter(fd,h,'replicate').^2+imfilter(fd,h','replicate').^2);
l=watershed(g);%分水岭运算
wr=l==0; 	
rm=imregionalmin(g);            	%计算图像的区域最小值定位
im=imextendedmin(f,2);    	%上面仅是产生最小值点
fim=f;                   
fim(im)=175;              	%将im在原图上标识出，用以观察 
lim=watershed(bwdist(im));          	%再次分水岭计算
em=lim==0;
g2=imimposemin(g,im|em);     	%在梯度图上标出im和em 
l2=watershed(g2);          	%第三次分水岭计算
f2=f;
f2(l2==0)=255;            	%从原图对分水岭进行观察
figure
subplot(3,3,1),
imshow(f);
subplot(3,3,2),
imshow(g);
subplot(3,3,3),
imshow(l);
subplot(3,3,4),
imshow(im);
subplot(3,3,5),
imshow(fim);
subplot(3,3,6),
imshow(lim);
subplot(3,3,7),
imshow(g2);
subplot(3,3,8),
imshow(l2)
subplot(3,3,9),
imshow(f2);
%运行结果如图 11 19所示
