
%��ȡ
EI=imread('WatMatImage.tif');
SizeR=4;
load FlagSpace;         %ˮӡǶ��λ��
load MatWatMak;            %ԭʼˮӡ
[d1_sort,index,D]=SortDblock(EI,step,sizeR);    %����D�鼯�ϰ��漣������
ExPara=ExFindFractalPara(OI,SizeR,step,d1_sort,index,D);
    %��R�鼯���еĿ������ƥ���ķ��β���
FlagSpace=GenExSpace(u1,x1,u2,x2,size(EI));     %ˮӡǶ��λ��
Ew=ExWatMak(ExPara,FlagSpace);              %��ȡˮӡ
Sim=SimilarFun(Ew,W);               %�������ƶ�