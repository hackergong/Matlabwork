clear all;

back1=imread('lena1.tif');
back0=zeros(256,256);
for i=1:256
   for j=1:256
      if back1(i,j)>0
         x0=j-128;
         y0=i-29;  
         for n=4:4
            [x1,y1]=cal(x0,y0,n);
            x1=round(x1)+128;
            y1=round(y1)+29;
            back0(y1,x1)=100;
         end
      end
   end
end
imshow(back0);

