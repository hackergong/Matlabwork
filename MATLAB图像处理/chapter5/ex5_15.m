sc=get(0,'ScreenSize');
W=sc (3);H=sc (4); 
hf=figure('Color',[1,1,1],'Position',[1,1,0.4*W,0.3*H],...
'Name','²Ëµ¥Ê¾Àý','NumberTitle','off','MenuBar','none');
hfile=uimenu(hf,'label','&file');
hhelp=uimenu(hf,'label','&help');
uimenu(hfile,'label',' New ','call','disp(''New Item'')');
uimenu(hfile,'label',' Open ','call','disp(''Open Item'')');
hsave=uimenu(hfile,'label','&save','Enable','off');
uimenu(hsave,'label','Text file','call','k1=0;k2=1;file01;');
uimenu(hsave,'label','Graphics file','call','k1=1;k2=0;file10;'); 
uimenu(hfile,'label','&Save As ','call','disp(''Save As Item'')');
uimenu(hfile,'label',' close ','separator','on','call','close(hf)');
uimenu(hhelp,'label','about','call',...
['disp(''Help Item'');','set(hsave,''Enable'',''on'')']);
