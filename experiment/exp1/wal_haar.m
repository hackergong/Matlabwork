clear all;
image=imread('lena.tif');       %��ȡԭʼͼƬ
image=rgb2gray(image);          
W=randi(1,10,2);                 %����ˮӡ
save W;               
nlevel=4;                   %ˮӡ�ֽ����
SrcI=wavelettrasform(image,nlevel);  %С���任
Hvs=hvsfun(SrcI);       %������ͷֱ��ʲ��JND
StpCtrFct=input('enter Quantition-step-control factor,');
%���������������ӣ�Ҳ����ȡˮӡ��Կ
save Key StpCtrFct;
Hvs=HvsFun(ScrI);
DesI=FraWatMakIns(SrcI,nlevel,Hvs,StpCtrFct,W);  %Ƕ��ˮӡ
Dimage=inv_wavelettransform(DesI,nlevel);
%��С���任
Dimage=uint8(Dimage);
imwrite(Dimage,'WatMakImage.tif');%д��ͼ��
figure(1); imshow(Dimage);          %��ʾͼ��
psnr=PsnrImage(SrcI,Desl);              