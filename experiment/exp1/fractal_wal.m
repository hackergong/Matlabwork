
%Ƕ��
OI=imread('lena.tif');    %��ȡԭʼͼ��
W=GenWatMak();              %����ˮӡ
Save MatWatMak W;
SizeR=4;                    %����R��Ĵ�С������R�鼯��
step=1;                     %ѡȡD��ʱ��ˮƽ��ֱ����Ļ�������
[d1_sort,index,D]=SortDblock(OI,step,sizeR);    %����D�鼯�ϰ��漣������
[FlagSpace,u1,x1,u2,x2]=GenSpace(size(Oimage)); 
%ˮӡǶ���R��λ��u1,x1,u2,x2Ϊ�����������еĳ�ֵ,��ȡ��Կ

save MatFlagSpace [u1,x1,u2,x2];
Para=FindFractalPara(OI,W,sizeR,step,d1_sort,index,D,FlagSpace);
%��R�鼯���е�ÿ��������β�����Ƕ��ˮӡλ�õ����ƥ��D��ֻ�����ڼ���A��B�е�һ����
Dimage=FractalDecode(size(OI),Para);
%���α��룬�����β�������ˮӡͼ��
Dimage=uint8(Dimage);
imwrite(Dimage,"WatMakImage.tif");          %д��ͼ��
figure(1);imshow(Dimage);                   %��ʾͼ��
psnr(PsnrImage(SrcI,DesI);                  %�����ֵ�����