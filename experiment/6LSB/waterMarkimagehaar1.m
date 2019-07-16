clc
clear all
close all
% ��ԭͼ
imOri=imread('lena.jpg');
%���š��ҶȻ�ԭͼ
imOri=imresize(imOri,[512 512]);
imOri=rgb2gray(imOri);
%����С���任
[C,S] = wavedec2(imOri,2,'haar');
[LHorig1,HLorig1,HHorig1] = detcoef2('all',C,S,1);
LLorig1 = appcoef2(C,S,'haar',1); 
[LHorig2,HLorig2,HHorig2] = detcoef2('all',C,S,2);
LLorig2 = appcoef2(C,S,'haar',2); 

% C2 = [LLorig2(:); LHorig2(:); HLorig2(:); HHorig2(:);  LHorig1(:); HLorig1(:); HHorig1(:)];
% S2=S;
% X = waverec2(C2,S2,'haar');

% ��ˮӡͼ
imWat=imread('logo.jpg');
% ���š��ҶȻ�ˮӡͼ
imWat=imresize(imWat,[512 512]);
imWat=rgb2gray(imWat);
%����С���任
% [LLw,LHw,HLw,HHw] = haart2(imWat,2);
[C,S] = wavedec2(imWat,2,'haar');
[LHw1,HLw1,HHw1] = detcoef2('all',C,S,1);
LLw1 = appcoef2(C,S,'haar',1); 
[LHw2,HLw2,HHw2] = detcoef2('all',C,S,2);
LLw2 = appcoef2(C,S,'haar',2); 

% ��ˮӡ���ͼ
Wratio=0.01;
LLwatermarked = LLorig2+Wratio*LLw2;
C2 = [LLwatermarked(:); LHorig2(:); HLorig2(:); HHorig2(:);  LHorig1(:); HLorig1(:); HHorig1(:)];
S2=S;
imNew = uint8(waverec2(C2,S2,'haar'));

% �����ˮӡ���ͼ
imwrite(imNew,'lena-logo.png')

% ��ͼ 
figure;
imshowpair(imOri,imNew,'montage')

imNew=imread('lena-logo.png')

figure;
imagesc(double(imNew)-double(imOri))
colormap(gray)

%% 
% T=mat2gray(double(imNew)-double(imOri))    %��һ������ת��Ϊһ���Ҷ�ͼ��
 T=double(imNew)-double(imOri)

 figure('name','�鿴ˮӡͼ��ԭͼ����')
 subplot(1,3,1)
 imshow(imWat)
 title('ԭͼ')
 set(get(gca,'title'),'fontname','΢���ź�');
 subplot(1,3,2)
 
 imshow(T,[])   %�Զ��������ݵķ�Χ�Ա�����ʾ
 title('ˮӡͼ')
 set(get(gca,'title'),'fontname','΢���ź�');
 dNC = nc(imWat,T);
 subplot(1,3,3) 
 title(['NC=' num2str(dNC)])
 
 [PSNR, MSE]=psnr1(imOri,imNew)
 
 
 
 
 