clear
clc
varX=['NumStr=get(heNum,''String'');',...             %调用过程
        'Num=str2num(NumStr);',...
       'x=0:0.1:Num*pi;' ];
hf=figure('Position',[200 200 600 400] ,...
           'Name','Uicontrol1' ,...
           'NumberTitle','off');
ha=axes('Position',[0.4 0.1 0.5 0.7],...
            'Box','on');
heNum=uicontrol(hf,'Style','edit',...                    %可编辑文本框
                  'Position',[50 270 100 20],...
                  'String','6',...                              %默认输入为4
                   'CallBack',varX);   
