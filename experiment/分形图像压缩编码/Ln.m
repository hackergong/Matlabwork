function D=Ln(R,j,i);
%仿射变换，共8种信射变换。
for k=0:j-1
   for l=0:j-1
      if i==1
      D(k+1,l+1)=R(k+1,l+1);
      elseif i==2
      D(k+1,l+1)=R(k+1,j-l);
      elseif i==3
      D(k+1,l+1)=R(j-k,l+1);
      elseif i==4
      D(k+1,l+1)=R(l+1,k+1);
      elseif i==5
      D(k+1,l+1)=R(j-l,j-k);
      elseif i==6
      D(k+1,l+1)=R(l+1,j-k);
      elseif i==7
      D(k+1,l+1)=R(j-k,j-l);
      elseif i==8
      D(k+1,l+1)=R(j-l,k+1);
      else 
      D(k+1,l+1)=R(k+1,l+1);
      end
   end
end
