clear all;
image=imread('lena.tif');       %读取原始图片
image=rgb2gray(image);          
W=randi(1,10,2);                 %生成水印
save W;               
nlevel=4;                   %水印分解层数
SrcI=wavelettrasform(image,nlevel);  %小波变换
Hvs=hvsfun(SrcI);       %计算最低分辨率层的JND
StpCtrFct=input('enter Quantition-step-control factor,');
%量化步长控制因子，也是提取水印密钥
save Key StpCtrFct;
Hvs=HvsFun(ScrI);
DesI=FraWatMakIns(SrcI,nlevel,Hvs,StpCtrFct,W);  %嵌入水印
Dimage=inv_wavelettransform(DesI,nlevel);
%逆小波变换
Dimage=uint8(Dimage);
imwrite(Dimage,'WatMakImage.tif');%写入图像
figure(1); imshow(Dimage);          %显示图像
psnr=PsnrImage(SrcI,Desl);              