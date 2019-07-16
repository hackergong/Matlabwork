[x,y,z] = cylinder;
I = imread('zh.tif');
subplot(1,2,1),warp(x,y,z,I); %将图像纹理映射到圆柱面
[x,y,z] = sphere(50);
subplot(1,2,2),warp(x,y,z,I); %将图像纹理映射到球面
