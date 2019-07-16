%��ͼ����ж�ȡ����ǿ��
I = imread('bag.png');%��ȡͼ��
figure; subplot(231);imshow(I)%��ʾԭͼ��
title('ԭʼͼ��');
claheI = adapthisteq(I,'NumTiles',[10 10]); 
claheI = imadjust(claheI);%���ȵ���
subplot(234);imshow(claheI);%��ʾ��ǿ���ͼ��
title('��ǿ���ͼ��');

%��ͼ�������ȴ�С�ķֲ����м��㡣
for counter = 0:22
    remain = imopen(claheI, strel('disk', counter));%������
    intensity_area(counter + 1) = sum(remain(:));%ʣ�����غ�
end
subplot(232);plot(intensity_area, 'm - *'), %��ʾ��ͬ�뾶��������ʣ������غ�
title('��ͬ�뾶��������ʣ������غ�');
grid on;
%�Բ�ͬ�뾶�µ����ȷֲ����м��㡣
intensity_area_prime= diff(intensity_area);%���
subplot(235);plot(intensity_area_prime, 'm - *'), %��ʾÿ���뾶�µ����ȶ���
title('ÿ���뾶�µ�����');

grid on;
set(gca, 'xtick', [0 2 4 6 8 10 12 14 16 18 20 22]);
open5 = imopen(claheI,strel('disk',5));%�뾶Ϊ5����̬ѧ������
open6 = imopen(claheI,strel('disk',6));%�뾶Ϊ6����̬ѧ������
rad5 = imsubtract(open5,open6);%�뾶Ϊ5������
subplot(233);imshow(rad5,[]);%��ʾ�뾶Ϊ5��ͼ�������ȷֲ����
title('���ȷֲ����');
