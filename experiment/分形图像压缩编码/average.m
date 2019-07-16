function R=average(I,j);
%求平均，表示将2（J）*2（J）大小子块的灰度图像中的邻近四像素点灰度求平均抽取，变成2（J-1）*2（J-1）大小的子块。
for k=1:j/2
   for l=1:j/2
      R(k,l)=round((I(2*k-1,2*l-1)+I(2*k,2*l)+I(2*k-1,2*l)+I(2*k,2*l-1))/4);
   end 
end
