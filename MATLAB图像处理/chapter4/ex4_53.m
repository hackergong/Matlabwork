close all
subplot(1,3,1)
ezsurf(@(t,s)(cos(t).*cos(s)),@(t,s)(cos(t).*cos(s)),@(t,s)cos(t),[0,1.5*pi,0,1.5*pi])
axis auto;
title('auto')
subplot(1,3,2)
ezsurf(@(t,s)(cos(t).*cos(s)),@(t,s)(cos(t).*cos(s)),@(t,s)cos(t),[0,1.5*pi,0,1.5*pi])
axis equal;
title('equal')
subplot(1,3,3)
ezsurf(@(t,s)(cos(t).*cos(s)),@(t,s)(cos(t).*cos(s)),@(t,s)cos(t),[0,1.5*pi,0,1.5*pi])
axis square;
title('square')
