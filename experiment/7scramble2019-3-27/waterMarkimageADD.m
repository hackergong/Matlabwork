% ��ԭͼ
imOri=imread('lena.jpg');
%���š��ҶȻ�ԭͼ
imOri=imresize(imOri,[512 512]);    
% imOri=rgb2gray(imOri);       

% ��ˮӡͼ
[imWat,map1]=imread('QQ.png');
% ���š��ҶȻ�ˮӡͼ
figure('name','non-watermark');
imshow(imWat)
imWat=imresize(imWat,[512 512]);

% imWat=rgb2gray(imWat);

% ��ˮӡ���ͼ
imNew=uint8(double(imOri)+0.05*double(imWat));

% �����ˮӡ���ͼ
imwrite(imNew,'lena-QQ.png')

% ��ͼ 
figure('name','watermark');
imshowpair(imOri,imNew,'montage')
imNew=imread('lena-QQ.png');
figure('name','��ȡ����ˮӡͼ');
imagesc(uint8((double(imNew)-double(imOri))/0.05))

Y=uint8((double(imNew)-double(imOri))/0.05);

figure('name','ˮӡͼ');
imshow(Y)

[PSNR, MSE]=psnr1(imOri,imNew)









