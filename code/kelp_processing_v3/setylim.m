%% Set Y Limits

ylim([str2double(get(PARAMS.hiylimmin,'str')) str2double(get(PARAMS.hiylimmax,'str'))]);

PARAMS.hiylimmin=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .536 .085 .032], ...
    'str',min(ylim),'foreg',[0 0 1],'backg',[1 1 1]);
PARAMS.hiylimmax=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .504 .085 .032], ...
    'str',max(ylim),'foreg',[0 0 1],'backg',[1 1 1]);