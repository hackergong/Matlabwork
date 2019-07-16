%����VideoReader������ȡ��Ƶ�ļ���
rhinosObj = VideoReader ('rhinos.avi'); ('rhinos.avi');%����Ƶ�ļ��ж�ȡ����
get(rhinosObj) 
implay('rhinos.avi'); 
%����Ƶ�ļ���һ֡ͼ����д��������ͼ 13 17��ʾ
darkCarValue = 50;						%��ֵ
darkCar = rgb2gray(read(rhinosObj,71));	%ת��Ϊ�Ҷ�ͼ��
noDarkCar = imextendedmax(darkCar,darkCarValue);		%ȥ��ͼ������ɫ��Ŀ��
figure; subplot(131)
imshow(darkCar) 
subplot(132); imshow(noDarkCar) 
sedisk = strel('disk',2);								%Բ�νṹԪ��
noSmallStructures = imopen(noDarkCar, sedisk);			%������
subplot(133);  imshow(noSmallStructures)				%ȥ��СĿ��
%��ͼ��ʹ��ѭ�������д�����������ͼ 13 18��ʾ
nframes = get(rhinosObj, 'NumberOfFrames');		%֡��
I = read(rhinosObj, 1);							%��һ֡ͼ��
taggedCars = zeros([size(I,1) size(I,2) 3 nframes], class(I));
for k = 1 : nframes
    singleFrame = read(rhinosObj, k);				%��ȡͼ��
    I = rgb2gray(singleFrame); 
    noDarkCars = imextendedmax(I, darkCarValue); 
    noSmallStructures = imopen(noDarkCars, sedisk); 
    noSmallStructures = bwareaopen(noSmallStructures, 150); 
    L = bwlabel(noSmallStructures); 
    taggedCars(:,:,:,k) = singleFrame;
    if any(L(:))
       stats = regionprops(L, {'centroid','area'});		%��ȡ���ĺ����
       areaArray = [stats.Area];						%��ȡĿ���������
       [junk,idx] = max(areaArray);					%��ȡ������
       c = stats(idx).Centroid; 
       c = floor(fliplr(c));
       width = 2;
       row = c(1)-width:c(1)+width; 
       col = c(2)-width:c(2)+width;
       taggedCars(row,col,1,k) = 255; 
       taggedCars(row,col,2,k) = 0;
       taggedCars(row,col,3,k) = 0;
    end
end
frameRate = get(rhinosObj,'FrameRate');
implay(taggedCars,frameRate); 
