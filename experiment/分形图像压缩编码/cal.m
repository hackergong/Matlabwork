
function  [x1,y1]=cal(x0,y0,i)
% calculate the new value of x,y;
if i==1 
    a=0; 
      b=0;
      c=0;
      d=0.17;
      e=0;
      f=0;
end
if i==2 
     a=0.84962; 
      b=0.0255;
      c=-0.0255;
      d=0.84962;
      e=0;
      f=30.0;
end
if i==3 
     a=-0.1554; 
      b=0.235;
      c=0.19583;
      d=0.18648;
      e=0;
      f=12.0;
end
if i==4 
    a=0.1554; 
      b=-0.235;
      c=0.19583;
      d=0.18648;
      e=0;
      f=30.0;
end
x1=a*x0+b*y0+e;
y1=c*x0+d*y0+f;
