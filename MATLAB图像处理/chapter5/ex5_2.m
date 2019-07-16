fig=meshgrid(2:100);
mesh(fig)
vw=get(gca,'View');
Hc_az=uicontrol(gcf, 'Style', 'slider', 'Position', [10  5  140 20], 'Min', -90, 'Max', 90, 'Value', vw(1), 'CallBack', ['set(Hc_cur,"String",num2str(get(Hc_az,"Value")))', 'set(gca, "View", [get(Hc_az,"Value") , vw(2)])']);
Hc_min=uicontrol(gcf,'Style','text','Position',[10  25  40  20],'String',[num2str(get(Hc_az, 'Min' )),num2str(get(Hc_az, 'Min'))]);
Hc_max=uicontrol(gcf, 'Style', 'text', 'Position', [110  25  40  20], 'String', num2str(get(Hc_az,'Max')));
Hc_cur=uicontrol(gcf, 'Style', 'text', 'Position', [60  25  40  20], 'String' , num2str(get(Hc_az,'Value')));
Axis off
