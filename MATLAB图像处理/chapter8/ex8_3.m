about={...
'��ʵ��˵����'
'�ַ������ܹ�����'
'��ʵ��ֻ�޶������ַ�����'
'ʵ��ֻ��˵��һ������������̡�'};
disp(about);str=input('�������ַ���');
l=0;r=1;d=1;
p=[0.2 0.3 0.1 0.15 0.25 0.35]; 	%��ʼ���
n=length(str); 	%�ַ��ĸ��ʷֲ���sum(p)=1
disp('_ a e r s t')
disp(num2str(p))
for i=1:n
  switch str(i)
    case '_'
      m=1;
    case 'a'
      m=2;
    case 'e'
      m=3;
    case 'r'
      m=4;
    case 's'
      m=5;
  case 't'
      m=6;
    otherwise
      error('�벻Ҫ���������ַ���');
    end
    pl=0;pr=0; 	%�ж��ַ�
     for j=1:m-1
        pl=pl+p(j);
     end
     for j=1:m
        pr=pr+p(j);
     end
      l=l+d*pl;     	%����ͳ��
      r=l+d*(pr-pl);
      strl=strcat('�����',int2str(i),'���ŵļ�����ұ߽磺');
      disp(strl);
      format long
      disp(l);disp(r);
      d=r-l;
end
 l=l+d*pl;
 r=l+d*(pr-pl);
 str1=strcat('�����',int2str(i),'���ŵļ�����ұ߽磺');
 disp(strl);
 format long
 disp(l);disp(r);
 d=r-1;
end
