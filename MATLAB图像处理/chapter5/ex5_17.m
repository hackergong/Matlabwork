m=uicontextmenu;
subplot(1,3,1)
h1=line([1,2],[2,2],'LineWidth',12,'UIContextMenu',m)
c1=['subplot(1,3,2);line([1 2],[1 3])'];
c2=['subplot(1,3,3);plot(magic(4))'];
uimenu(m,'Label','line','Callback',c1);
uimenu(m,'Label',' magic(4)','Callback',c2);
