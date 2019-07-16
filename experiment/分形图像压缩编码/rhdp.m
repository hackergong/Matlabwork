function  [r,h,dp]=rhdp(R,B,J);
%比较R，B中元素（灰度）值的差别，J为R，B矩阵的行数。
m=J*J;
A1=0;
A2=0;
A3=0;
A4=0;
A5=0;
temp=ones(J);
for i=1:J
   for j=1:J
      A1=A1+R(i,j)*B(i,j);
      A2=A2+R(i,j);
      A3=A3+B(i,j);
      A4=A4+B(i,j)*B(i,j);
      A5=A5+R(i,j)*R(i,j);
   end 
end
if (R==temp)&(B==temp)
   r=1;
   h=0;
   dp=0;
else
   if (m*A4-A3*A3)==0                       %if (m*A4-A3*A3)==0,we do't select it as the last result.???
      r=1;
      h=0;
      dp=100;
   else
      r=(m*A1-A2*A3)/(m*A4-A3*A3);
      h=(A2-r*A3)/m;
      dp=(A5+r*(r*A4-2*A1+2*h*A3)+h*(h*m-2*A2))/m;
   end
end
  

   
