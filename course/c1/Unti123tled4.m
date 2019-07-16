for x=1:M
    
    for y=1:M
    ffx=0;
    for u=1:M
        for v=1:N
        fffx=ffx+F(u,v)*exp(1j*2*pi*((u-1)*(x-1)/M+(v-1)*(y-1)/N));
        end
    end
    ff(x,y)=ffx;
    end       
end
imshow(ff)