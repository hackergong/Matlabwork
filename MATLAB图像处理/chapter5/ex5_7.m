clear
clc
 PlotS=[ 
        'UD=get(hpcolor,''UserData'');',...
         'set(gcf,''Color'',UD(get(hpcolor,''Value''),:));'...
        ];
hf=figure('Position',[200 200 600 400] ,...
           'Name','Uicontrol1' ,...
           'NumberTitle','off');
ha=axes('Position',[0.4 0.1 0.5 0.7],...
            'Box','on');
 
   hpcolor=uicontrol(gcf,'Style','popupmenu',...
         'Position',[340 360 100 20],...
         'String','Black|Red|Yellow|Green|Cyan|Blue|Magenta|White',...
         'Value',1,...
         'UserData',[[0 0 0];...
                           [1 0 0];...
                           [1 1 0];...
                           [0 1 0];...
                           [0 1 1];...
                           [0 0 1];...
                           [1 0 1];...
                           [1 1 1]],...
         'CallBack',PlotS);
