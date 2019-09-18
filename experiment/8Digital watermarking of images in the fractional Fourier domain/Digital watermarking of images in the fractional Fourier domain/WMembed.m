function [wm_image,keys,ix] = WMembed(image,L,M,var,powers)
%
% embed n watermarks using gaussian technique
%
% IN : image : given image
%      L, M, var: vectors of length n
%              watermark i is imbedded in ix(i,L(i)+1:L(i)+M(i)), i = 1:n
%              which are a Gaussian random variables with variance var(i)/2
%              n = min (length(L),length(M),length(var))
%      powers : powers used in the frft2d
%
% OUT: wm_image : the image with m watermarks
%      keys     : the n watermarks or the seeds to generate them
%                   this is decided by setting the switch 'noseeds' below
%      ix       : location where watermarks are embedded
%
% EXAMPLE:
% [wm_image,keys,ix] = WMembed(lena,[72000,100000],[8000,4000],[0.4,0.5],[0.8,0.8]);
%

% set noseeds = 1 if you want to pass on the random sequences
% set noseeds = 0 if you want to pass only the seeds for the random sequences

noseeds = 0;

n = min([length(L),length(M),length(var)]);

% compute 2D-frft of image
% and sort coefficients

S = frft2d(image,powers);
sizeS = size(S);
[val, ix] = sort(abs(S(:)));
S = S(:);

% embed the n watermarks

for i = 1:n

   Swm = S(ix(L(i)+1:L(i)+M(i)));

   if ( noseeds ), % pass on the random sequences

     key1 = normrnd(0,sqrt(var(i)/2),M(i),1);
     key2 = normrnd(0,sqrt(var(i)/2),M(i),1);
     keys{i} = [key1 key2];

   else % pass on the seeds

     seed1 = random('unif',0,1000000000);
     randn('seed',seed1);
     key1 = sqrt(var(i)/2)*randn(M(i),1);
     seed2 = random('unif',0,1000000000);
     randn('seed',seed2);
     key2 = sqrt(var(i)/2)*randn(M(i),1);
     keys{i}=[seed1 seed2];

   end

   Swm = Swm + abs(real(Swm)).*key1 + j*abs(imag(Swm)).*key2;
   S(ix(L(i)+1:L(i)+M(i))) = Swm;

end

S = reshape(S,sizeS);

wm_image = frft2d(S,-powers);
