clear
clc
hf=figure('Position',[200 200 600 400] ,...
           'Name','Uicontrol1' ,...
           'NumberTitle','off');
ha=axes('Position',[0.4 0.1 0.5 0.7],...
            'Box','on');
hbg=uibuttongroup('units','pixels',...                 %按钮组
                'Position',[48 178 104 70],...
               'Title','按钮组示例' );                   %按钮组标题
hrboxoff=uicontrol(gcf,'Style','radio',...             %单选按钮off
               'Position',[50 180 100 20],...
               'String','Set box off',...
               'Value',0,...
               'CallBack',[...
                              'set(hrboxon,''Value'',0);'...
                              'set(hrboxoff,''Value'',1);'...
                              'set(gca,''Box'',''off'');']);
hrboxon=uicontrol(gcf,'Style','radio',...              %单选按钮on
                'Position',[50 210 100 20],...
                'String','Set box on',...
                'Value',1,...
                'CallBack',[...
                               'set(hrboxon,''Value'',1);'...
                              'set(hrboxoff,''Value'',0);'...
                              'set(gca,''Box'',''on'');']);
