function [noisy_image] = addnoise(image,variance)
%
% embed gaussian noise given variance in given image
%
noise = random('norm',0,sqrt(variance),size(image));
noisy_image = double(image) + noise;
