
%提取
EI=imread('WatMatImage.tif');
SizeR=4;
load FlagSpace;         %水印嵌入位置
load MatWatMak;            %原始水印
[d1_sort,index,D]=SortDblock(EI,step,sizeR);    %划分D块集合按叉迹并排序
ExPara=ExFindFractalPara(OI,SizeR,step,d1_sort,index,D);
    %对R块集合中的块求最佳匹配块的分形参数
FlagSpace=GenExSpace(u1,x1,u2,x2,size(EI));     %水印嵌入位置
Ew=ExWatMak(ExPara,FlagSpace);              %提取水印
Sim=SimilarFun(Ew,W);               %计算相似度