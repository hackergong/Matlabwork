back0=zeros(256,256);  %old picture
back1=zeros(256,256);   % new picture
leaf1=ones(100,100);    %160);
back1([29:128],[79:178])=leaf1;
for m=1:50
   back0=back1;
   back1=zeros(256,256);
   m
for i=1:256
   for j=1:256
      if back0(i,j)>0
         x0=j-128;
         y0=i-29;  %j-29?????
         for n=1:4
            [x1,y1]=cal(x0,y0,n);
            x1=round(x1)+128;
            y1=round(y1)+29;
            back1(y1,x1)=100;
         end
      end
   end
end
end
imshow(back1);

