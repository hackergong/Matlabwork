Q=peaks(40);
Q(18:20,9:15)=NaN;    %Он©у
surfc(P);
colormap(summer);
light('position',[50,-10,5]),lighting flat;
material([0.9,0.9,0.6,15,0.4]);
