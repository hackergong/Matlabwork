%��ȡͼ��ͨ���ü�����Ҫ��׼��������
hestain = imread('hestain.png');%��ȡhestainͼ��
peppers = imread('peppers.png');%��ȡpeppersͼ��
figure; subplot(221)
imshow(hestain) 
title(' hestain ');
subplot(222),
imshow(peppers) 
title(' peppers ');
%��ȡͼ��ͨ���ü�����Ҫ��׼��������
rect_hestain = [111 33 65 58];%ȷ��hestainͼ�������
rect_peppers = [163 47 143 151];%ȷ��peppersͼ�������
sub_hestain = imcrop(hestain,rect_hestain); 
sub_peppers = imcrop(peppers,rect_peppers); 
subplot(223),
imshow(sub_hestain) 
title(' hestain�������� ');
subplot(224),
imshow(sub_peppers) 
title(' peppers�������� ');
