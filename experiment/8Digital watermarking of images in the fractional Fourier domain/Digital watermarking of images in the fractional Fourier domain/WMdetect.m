function [d,threshold] = WMdetect(wm_image,keys,ix,L,M,var,powers)
%
% detect watermark using technique 1 (alternative)
% IN : wm_image : the image
%      keys     : the watermark real and imaginary part (complex vector)
%      ix,L,M   : watermark is supposedly embedded in FRFT(ix(L+1:L+M))
%      var      : variance of watermark
%      powers   : powers of FRFT used to embed watermark
% OUT: d        : the detection value
%      threshold: value that is used to compare d with
%
% usage [d,threshold] = WMdetect(wm_image,key,ix,96000,8000,0.4,0.8,0.8)
%

%
% choose numrand = the number of random watermarks to be generated
% setting debug = 0 suppresses the output of auxiliary results
%

numrand = 100;
debug = 1;
n = min([length(L),length(M),length(var)]);

% 2D-frft of watermarked image, and select appropriate coefficients
% that are supposedly watermarked

wmfrft = frft2d(wm_image,powers);
Swmt = wmfrft(:);

for i = 1:n
    
  Swm = Swmt(ix(L(i)+1:L(i)+M(i)));
  stdev = sqrt(var(i)/2);

% compute detection value for the correct watermark

  if (length(keys{i}) == 2), % received the seeds, hence generate the random sequences

    if (debug), disp('using seeds'), end
    randn('seed',keys{i}(1));
    markr = stdev*randn(M(i),1);
    randn('seed',keys{i}(2));
    marki = stdev*randn(M(i),1);
 
  else % received the random sequences
    
    if (debug), disp('no seeds'), end  
    markr = keys{i}(:,1);
    marki = keys{i}(:,2);
    
  end

  d(i) = abs(sum((markr-j*marki).*Swm));

% generate N = numrand watermarks to find out its mean and std

  for k = 1:numrand
     key1 = normrnd(0,stdev,M(i),1);
     key2 = normrnd(0,stdev,M(i),1);
     d1(k,i) = abs(sum((key1-j*key2).*Swm));
  end

% which defines the threshold

  threshold(i) = mean(d1(:,i)) + 4*std(d1(:,i));


% Compare detection value of exact with threshold
% The correct watermark is detected if its detection value is more
% than 4*std away from the detection value of a random watermark

  if (d(i) < threshold(i)), disp (['watermark ',int2str(i),' not found'])
  else                      disp (['watermark ',int2str(i),' found'])
  end

  if (debug), global fignum

    nplot = numrand+1; nplot2 = floor(nplot/2);
    meanplot = mean(d1(:,i));
    threshplot = threshold(i);
    stdevplot = std(d1(:,i));
    disp(sprintf(...
       ' numrand = %d\n mean = %5.2f\n st.dev = %5.2f\n threshold = %5.2f\n det.value = %5.2f',...
         [numrand,      meanplot,      stdevplot,        threshplot,        d(i)]))
    figure(fignum+i),
    plot(1:nplot,[d1(1:nplot2,i).', d(i), d1(nplot2+1:end,i).'],'-r',...
         1:nplot,ones(nplot,1)*threshplot,'--b',...
         1:nplot,ones(nplot,1)*meanplot,'-b'...
         ), axis('tight')

    indfalse = find(d1(:,i) > threshold(i));
    nfalse = length(indfalse);
    disp(sprintf(' false alarms = %d',nfalse))

  end
end  
