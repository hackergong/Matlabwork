clear all;
BW1 = imread('circles.png'); 
BW2 = bwmorph(BW1,'skel',Inf);
subplot(221);imshow(BW1)
title('¶þÖµÍ¼Ïñ')
subplot(222); imshow(BW2)
title('Í¼ÏñµÄ¹Ç¼Ü')
BW3 = bwperim(BW1);
subplot(223);imshow(BW1)
title('Í¼Ïñ')
subplot(224), imshow(BW3)
title('Í¼Ïñ±ß½ç')
