clear all;
[I,map]=imread('trees.tif');
J=imrotate(I,35,'bilinear');
J1=imrotate(I,35,'bilinear','crop');  %����˫���Բ�ֵ����ͼ�����ˮƽ��ת
J2=imrotate(I,35,'nearest','crop');  %��������ڲ�ֵ����ͼ�����ˮƽ��ת
J3=imrotate(I,35,'bicubic','crop');  %����˫������ֵ����ͼ�����ˮƽ��ת
subplot(2,3,1),
imshow(I,map)
title('ԭʼͼ��')
subplot(2,3,2),
imshow(J,map)
title('˫���Բ�ֵ')
subplot(2,3,3),
imshow(J1,map)  
title('˫���Բ�ֵ')
subplot(2,3,4),
imshow(J2,map)  
title('����ڲ�ֵ')
subplot(2,3,5),
imshow(J3,map)  
title('˫������ֵ')
