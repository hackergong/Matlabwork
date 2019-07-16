%利用VideoReader函数读取视频文件。
rhinosObj = VideoReader ('rhinos.avi'); ('rhinos.avi');%从视频文件中读取数据
get(rhinosObj) 
implay('rhinos.avi'); 
%将视频文件的一帧图像进行处理，结果如图 13 17所示
darkCarValue = 50;						%阈值
darkCar = rgb2gray(read(rhinosObj,71));	%转化为灰度图像
noDarkCar = imextendedmax(darkCar,darkCarValue);		%去除图像中深色的目标
figure; subplot(131)
imshow(darkCar) 
subplot(132); imshow(noDarkCar) 
sedisk = strel('disk',2);								%圆形结构元素
noSmallStructures = imopen(noDarkCar, sedisk);			%开操作
subplot(133);  imshow(noSmallStructures)				%去除小目标
%对图像使用循环法进行处理，检验结果如图 13 18所示
nframes = get(rhinosObj, 'NumberOfFrames');		%帧数
I = read(rhinosObj, 1);							%第一帧图像
taggedCars = zeros([size(I,1) size(I,2) 3 nframes], class(I));
for k = 1 : nframes
    singleFrame = read(rhinosObj, k);				%读取图像
    I = rgb2gray(singleFrame); 
    noDarkCars = imextendedmax(I, darkCarValue); 
    noSmallStructures = imopen(noDarkCars, sedisk); 
    noSmallStructures = bwareaopen(noSmallStructures, 150); 
    L = bwlabel(noSmallStructures); 
    taggedCars(:,:,:,k) = singleFrame;
    if any(L(:))
       stats = regionprops(L, {'centroid','area'});		%求取质心和面积
       areaArray = [stats.Area];						%求取目标对象的面积
       [junk,idx] = max(areaArray);					%求取最大面积
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
