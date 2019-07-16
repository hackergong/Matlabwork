screen=get(0,'ScreenSize');
W=screen(3);H=screen(4);
figure('Color',[1,1,1],'Position',[0.2*H,0.2*H,0.6*W,0.4*H],...
'Name','图形演示系统','NumberTitle','off','MenuBar','none');
%定义绘图菜单项
hplot=uimenu(gcf,'Label','&绘图');
uimenu(hplot,'Label','tan','Call',['t=-pi:pi/30:pi;','plot(t,tan(t));',...
'set(hgon,''Enable'',''on'');','set(hgoff,''Enable'',''on'');',...
'set(hbon,''Enable'',''on'');','set(hboff,''Enable'',''on'');']);
uimenu(hplot,'Label','cot','Call',['t=-pi:pi/30:pi;','plot(t,cot(t));',...
'set(hgon,''Enable'',''on'');','set(hgoff,''Enable'',''on'');',...
'set(hbon,''Enable'',''on'');','set(hboff,''Enable'',''on'');']);
%定义选项菜单项
hoption=uimenu(gcf,'Label','&选项');
hgon=uimenu(hoption,'Label','&Grig on','Call','grid on','Enable','off');
hgoff=uimenu(hoption,'Label','&Grig off','Call','grid off','Enable','off');
hbon=uimenu(hoption,'Label','&Box on','separator','on','Call','box on','Enable','off');
hboff=uimenu(hoption,'Label','&Box off','Call','box off','Enable','off');
hfigcor=uimenu(hoption,'Label','&Figure Color','Separator','on');
uimenu(hfigcor,'Label','&红','Accelerator','r','Call','set(gcf,''Color'',''r'');');
uimenu(hfigcor,'Label','&蓝','Accelerator','b','Call','set(gcf,''Color'',''b'');');
uimenu(hfigcor,'Label','&黄','Call','set(gcf,''Color'',''y'');');     
uimenu(hfigcor,'Label','&白','Call','set(gcf,''Color'',''w'');');     
%定义退出菜单项
uimenu(gcf,'Label','&退出','Call','close(gcf)');
