                                     %sat1=imread('saturn.tif');
%bone([1:64],[1:64])=rice([100:163],[100:163]);
%imshow(bone);
                                     %sat([1:328],[1:432])=sat1([1:328],[1:432]);
                                     %I=double(sat);
 %load testI;
rice1=imread('lena1.tif');
rice([1:64],[1:64])=rice1([1:64],[1:64]);
%rice=rice1;
%imshow(rice);     %test
I=double(rice);N=64;     %����ͼ��ÿ�е����أ�
M=64;
J=8;       %�ӿ�ÿ�е����ظ�����
D=2*J;  %16;      %����ÿ�е����أ�
r=ones(N/J,M/J);   %��¼��Ӧ��ÿ��R��i��j����rֵ��
h=zeros(N/J,M/J);   %��¼��Ӧ��ÿ��R��i��j����hֵ��
nn=ones(N/J,M/J);  %��¼��Ӧ��ÿ��R��i��j���ķ���任��n��
DD1=ones(N/J,M/J); %��¼��Ӧ��ÿ��R��i��j���ĸ���D���Ͻǵĵ��кţ�
DD2=ones(N/J,M/J); %��¼��Ӧ��ÿ��R��i��j���ĸ���D���Ͻǵ��кţ�
R=zeros(J,J);
B=zeros(D,D);
B1=zeros(J,J);
B2=zeros(J,J);
for i=1:J:(N-J+1)
   i
for j=1:J:(M-J+1)        %��һ��ѭ����Ŀ���Ǳ������е��ӿ飻
   e=100;
   R=out(I,J,i,j);  %��out������ԭͼ��I��ȡ��һ���ӿ�R��i,j Ϊ�ӿ�R�����Ͻ����ꡣ
   x=floor((i-1)/J)+1;
   y=floor((j-1)/J)+1;
   for k=1:(N-D+1)   %test %�ڶ���ѭ�������ÿһ�ӿ�R(i,j) ΪѰ����֮��µĸ��顣 
   for l=1:(M-D+1)  % test%k ,lΪ��������Ͻ����� 
    B=out(I,D,k,l);  %ȡ�������
    B1=average(B,D);  %�Ѵ�СΪD*D�ĸ���ͨ��ȡƽ�����ر�Ϊ��СΪJ*J���ӿ�B1
    for n=1:8         %��B1����8�ַ���任֮һ�õ�B2��
       B2=Ln(B1,J,n);  
       [r0,h0,dp0]=rhdp(R,B2,J);
       if dp0<e
          e=dp0;
          r(x,y)=r0;      
          h(x,y)=h0;
          nn(x,y)=n;
          DD1(x,y)=k;
          DD2(x,y)=l; 
       end
                 if e<0.5  %0.05          %�������ֵ0.005,������С�ڸ��������Բ�����ѭ��ֱ�ӽ�������һ��R�����D��Ѱ�ҡ�
                   break;
                 end
   end    %������ѭ����
              if e<0.5      %0.05
                  break;
              end
  end        %�ڶ���ѭ��������
              if e<0.5  %0.05
                 break;
              end

 end
end         %��һ��ѭ������
end
