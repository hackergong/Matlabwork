
%嵌入
OI=imread('lena.tif');    %读取原始图像
W=GenWatMak();              %生成水印
Save MatWatMak W;
SizeR=4;                    %设置R块的大小，划分R块集合
step=1;                     %选取D块时在水平垂直方向的滑动步长
[d1_sort,index,D]=SortDblock(OI,step,sizeR);    %划分D块集合按叉迹并排序
[FlagSpace,u1,x1,u2,x2]=GenSpace(size(Oimage)); 
%水印嵌入的R块位置u1,x1,u2,x2为二个混沌序列的初值,提取密钥

save MatFlagSpace [u1,x1,u2,x2];
Para=FindFractalPara(OI,W,sizeR,step,d1_sort,index,D,FlagSpace);
%对R块集合中的每个块求分形参数，嵌入水印位置的最佳匹配D块只能属于集合A或B中的一个。
Dimage=FractalDecode(size(OI),Para);
%分形编码，出分形参数生成水印图像。
Dimage=uint8(Dimage);
imwrite(Dimage,"WatMakImage.tif");          %写入图像
figure(1);imshow(Dimage);                   %显示图像
psnr(PsnrImage(SrcI,DesI);                  %计算峰值信噪比