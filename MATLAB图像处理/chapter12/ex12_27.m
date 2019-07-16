clear
J=imread('circles.png');
l=bwlabel(J);
stats=regionprops(l,'all');
stats(23)
