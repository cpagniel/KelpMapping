%% Set Parameters

DATA.DATE=get(PARAMS.hidate,'str');
DATA.TIME=get(PARAMS.hitime,'str');
DATA.FILENAME=get(PARAMS.hiname,'str');
DATA.ZOOM=get(PARAMS.hizoom,'str');

set(PARAMS.hidate,'en','off')
set(PARAMS.hitime,'en','off')
set(PARAMS.hiname,'en','off')
set(PARAMS.hizoom,'en','off')

set(MAIN.hf1,MAIN.wbd,'',MAIN.wbm,'',MAIN.wbu,'');
set(MAIN.hu1,'en','on')

%% Set Zoom

MAIN.hi1 = imagesc(DATA.IMG(1:str2double(DATA.ZOOM),:));
colormap(jet);
caxis([0 80])

set(MAIN.ha1,'dataaspectratio',[1 1 1]);
set(MAIN.ha1,'xgr','on','ygr','on');
set(MAIN.ha1,'XTickLabel',[])
set(MAIN.ha1,'YTickLabel',[])
