p=input('������Ʒ�۸�');
switch fix(p/100) 
   case {0,1}            	%С��200
      r=0;
   case {2,3,4}            	%200 ~500
      r=5/100;
   case num2cell(5:9)       	% 500~1000
      r=8/100;
   case num2cell(10:24)     	% 1000~2500
      r=15/100;
   case num2cell(25:49)     	% 2500~5000
      r=20/100;
   otherwise               	%���ڵ���5000
      r=25/100;
end
p=p*(1-r)                 	%�����Ʒʵ�����ۼ۸�
