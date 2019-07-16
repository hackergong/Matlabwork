[x,y,z]=meshgrid(-3:.3:3,-3:.3:3,-3:.3:3);
v=x.*exp(-x.^3-y.^3-z.^3);
slice(v,[4 14 31],31,[1 10]);
axis([0 31 0 31 0 31])
colormap(jet)
