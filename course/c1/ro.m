
I=imread('lena.tif');
[M,N,k]=size(I);  

W=N; %width
H=M;  %height
alpha=pi/3;

M1=[1 0 0;
    0 -1 0;
    -0.5*W 0.5*H 1;];
M2=[cos(alpha) -sin(alpha) 0;
    sin(alpha) cos(alpha) 0;
    0 0 1];  
M3=[1 0 0.5Wn;
    0 -1 0.5*Mn;
    0 0 1];
Wn=round(W*cos(alpha)+H*sin(alpha));
Hn=round(H*cos(alpha)+W*sin(alpha));
In=zeros(Wn,Hn,k);   
Mat=M3*M2*M1;

for i=1:M
    for j=1;N;
        pos=Mat*[j;i;1];%(x,y)=(j,i)
        pos=round(pos);
        In(pos(2),pos(1),:)=I(i,j,:);%Ô­Í¼ÏñËØÓ³Éäµ½ÐÂÍ¼
    end
end
figure(1);
imshow(In)

alpha=pi/3;
M2=[cos(alpha) -sin(alpha) 0;
    sin(alpha) cos(alpha) 0;
    0 0 1]; 

Mat=inv(Mat);
In=[]
for i=1:Hn
    for j=1:Wn
        pos=Mat*[j;i;1];
        pos=round(pos);
        if pos(2)>0&&pos(1)<=H&&pos(1)>0&&pos(1)<=W
        In(j,i,:)=I(pos(2),pos(1),:);
        end
    end
end
figure(2);
imshow(uint8(In))















