%%%
%%% CENTRALCROP: CROP AN IMAGE ABOUT ITS CENTER
%%%   centralcrop( im, cx, cy )
%%%     im: grayscale or color image
%%%     cx: number of rows to crop from top and bottom
%%%     cy: number of columns to crop from left and right
%%%   Hany Farid; Image Science Group; Dartmouth College 
%%%   10.12.06
%%%

function [cropped_im] = centralcrop(im,cx,cy)
   
   [ydim,xdim,zdim] = size( im );
   crop = im(cx+1:end-cx, cy+1:end-cy, : );
   cropped_im = zeros(size(im,1),size(im,2));
   cropped_im(cx+1:end-cx,cy+1:end-cy) = crop;
