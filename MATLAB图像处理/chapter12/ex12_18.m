%读取图像。
I = imread('rice.png');%读取图像
figure;  imshow(I), %显示图像

%检验图像的边缘。
[junk threshold] = edge(I, 'sobel');%边缘检测
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);%改变参数再检测边缘
figure; subplot(221),
imshow(BWs), %显示二值图像
se90 = strel('line', 3, 90);%垂直的线性结构元素
se0 = strel('line', 3, 0);%水平的线性结构元素
BWsdil = imdilate(BWs, [se90 se0]);%对图像进行膨胀
subplot(222); imshow(BWsdil), %显示膨胀后的二值图像
BWdfill = imfill(BWsdil, 'holes');%对图像进行填充
subplot(223); imshow(BWdfill);%显示填充后的二值图像
BWnobord = imclearborder(BWdfill, 4); 
subplot(224); imshow(BWnobord), %运行结果如图 12 16所示

seD = strel('diamond',1);%菱形结构元素
BWfinal = imerode(BWnobord,seD);%腐蚀图像
BWfinal = imerode(BWfinal,seD);%腐蚀图像
figure; subplot(121)
imshow(BWfinal), %显示处理后的图像
BWoutline = bwperim(BWfinal); 
Segout = I;
Segout(BWoutline) = 255;
subplot(122), imshow(Segout), %在原始图像上显示边界
