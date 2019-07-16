I = imread('rice.png');                   % 读入图像
S = qtdecomp(I,.26);                         % 四叉树分解
blocks = repmat(uint8(0),size(S));              % 块
for dim = [512 256 128 64 32 16 8 4 2 1];    
  numblocks = length(find(S==dim));    
  if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);
    values(2:dim,2:dim,:) = 0;
    blocks = qtsetblk(blocks,S,dim,values);
  end
end
blocks(end,1:end) = 1;
blocks(1:end,end) = 1;
subplot(1,2,1);
imshow(I); 
title('原始图像')                                  % 显示原始图像
subplot(1,2,2);
imshow(blocks,[])                        % 显示处理后的图像
title('块状四叉树分解图像')
