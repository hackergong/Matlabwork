bonemarr=imread('lena_color_256.tif');
bone([1:64],[1:64])=rice([100:163],[100:163]);
imshow(bone);
I=double(bone);
%rice1=imread('rice.tif');
%rice([1:64],[1:64])=rice1([1:64],[1:64]);
%rice=rice1;
%imshow(rice);     %test
%I=double(rice);
N=64;     %����ͼ��ÿ�е����أ�
J=8;       %�ӿ�ÿ�е����ظ�����
D=16;      %����ÿ�е����أ�
r=zeros(N/J);   %��¼��Ӧ��ÿ��R��i��j����rֵ��
h=zeros(N/J);   %��¼��Ӧ��ÿ��R��i��j����hֵ��
nn=zeros(N/J);  %��¼��Ӧ��ÿ��R��i��j���ķ���任��n��
DD1=zeros(N/J); %��¼��Ӧ��ÿ��R��i��j���ĸ���D���Ͻǵĵ��кţ�
DD2=zeros(N/J); %��¼��Ӧ��ÿ��R��i��j���ĸ���D���Ͻǵ��кţ�
e=100;        %����һ�����ĳ�ֵ��
R=zeros(J,J);
B=zeros(D,D);
B1=zeros(J,J);
B2=zeros(J,J);
for i=1:J:(N-J+1)
for j=1:J:(N-J+1)        %��һ��ѭ����Ŀ���Ǳ������е��ӿ飻
   R=out(I,J,i,j);  %��out������ԭͼ��I��ȡ��һ���ӿ�R��i,j Ϊ�ӿ�R�����Ͻ����ꡣ
   r((i-1)/J+1,(j-1)/J+1)=1;      
   h((i-1)/J+1,(j-1)/J+1)=0;
   nn((i-1)/J+1,(j-1)/J+1)=1;
   DD1((i-1)/J+1,(j-1)/J+1)=1;
   DD2((i-1)/J+1,(j-1)/J+1)=1;          %��r��h��nn��DD1��DD2����ֵ��
   for k=1:(N-D+1)   %test %�ڶ���ѭ�������ÿһ�ӿ�R(i,j) ΪѰ����֮��µĸ��顣  
   for l=1:(N-D+1)  % test%k ,lΪ��������Ͻ����� 
    B=out(I,D,k,l);  %ȡ�������
    B1=average(I,D);  %�Ѵ�СΪD*D�ĸ���ͨ��ȡƽ�����ر�Ϊ��СΪJ*J���ӿ�B1
    for n=1:8         %��B1����8�ַ���任֮һ�õ�B2��
       B2=Ln(B1,J,n);  
       [r0,h0,dp0]=rhdp(R,B2,J);
       if dp0<e
          e=dp0;
          r((i-1)/J+1,(j-1)/J+1)=r0;      
          h((i-1)/J+1,(j-1)/J+1)=h0;
          nn((i-1)/J+1,(j-1)/J+1)=n;
          DD1((i-1)/J+1,(j-1)/J+1)=k;
          DD2((i-1)/J+1,(j-1)/J+1)=l; 
       end
                 %if e<0.005          %�������ֵ0.005,������С�ڸ��������Բ�����ѭ��ֱ�ӽ�������һ��R�����D��Ѱ�ҡ�
                 %  break;
                 %end
   end    %������ѭ����
              %if e<0.005
               %    break;
                % end
  end        %�ڶ���ѭ��������
             % if e<0.005
              %     break;
               %  end

 end
end         %��һ��ѭ������
end
