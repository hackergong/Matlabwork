%%%
%%% NWCROP: CROP AN IMAGE ABOUT ITS NW CORNER
%%%   nwcrop( im, cx, cy )
%%%     im: grayscale or color image
%%%     cx: number of rows to crop from top
%%%     cy: number of columns to crop from left
%%%   

function [cropped_im] = nwcrop(im,cx,cy)
   
   [ydim,xdim,zdim] = size( im );
   crop = im(1:cx, 1:cy, : );
   cropped_im = zeros(size(im,1),size(im,2));
   cropped_im(1:cx,1:cy) = crop;
