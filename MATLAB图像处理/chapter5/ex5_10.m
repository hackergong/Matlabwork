clear
clc
hf=figure('Position',[200 200 600 400] ,...
           'Name','Uicontrol1' ,...
           'NumberTitle','off');
 hp=uipanel('units','pixels',...                          %面板
            'Position',[48 78 110 100],...
       'Title','面板示例','FontSize',12);                    %面板标题
ha=axes('Position',[0.4 0.1 0.5 0.7],...
            'Box','on');
hbSin=uicontrol(hf,...
                'Style','pushbutton',...                    %sin按钮
                'Position',[50,120,100,30],...
                'String','绘制 sin(x)',...
                'CallBack',...
                            ['subplot(ha);'...
                             'x=0:0.1:4*pi;'...
                             'plot(x,sin(x));'...            %绘制sin
                             'axis([0 4*pi -1 1]);'...
                             'grid on;'...
                            'xlabel(''x'');'...
                            'ylabel(''y=sin(x)'');'...
                             ]);  
hbClose=uicontrol(hf,...
                'Style','pushbutton',...                    %结束按钮
                'Position',[50,80,100,30],...
                'String','退出',...
                'CallBack','close(hf)'); 
