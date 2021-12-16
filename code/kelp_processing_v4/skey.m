%% Set Current Species Code

set(MAIN.hstatus10,'str',char(PARAMS.sfull(PARAMS.icur,:)));
set(MAIN.hstatus10,'backg',PARAMS.scol(PARAMS.icur,:));

%% Get Click Point

MAIN.cnt = MAIN.cnt+1;

h = imfreehand();
h.setColor(PARAMS.scol(PARAMS.icur,:));

DATA.pos(MAIN.cnt) = {h.getPosition()};

DATA.XX{MAIN.cnt} = DATA.pos{MAIN.cnt}(:,1);
DATA.YY{MAIN.cnt} = DATA.pos{MAIN.cnt}(:,2);

DATA.SCODE(MAIN.cnt) = PARAMS.icur;

%% Update Count

DATA.COUNT(PARAMS.icur) = DATA.COUNT(PARAMS.icur)+1;

x0 = 0.75; y0 = 0.75;
y0 = y0 - 0.02*(PARAMS.icur);

MAIN.hu3(PARAMS.icur) = uicontrol(MAIN.hf1,'un','n','style','tex','pos',[x0+0.06 y0 .03 .02], ...
    'str',num2str(DATA.COUNT(PARAMS.icur)),'tag','hu','fontsize',9,'fontweight','b',...
    'backgroundcolor',PARAMS.scol(PARAMS.icur,:),'foregroundcolor','w');

clear h ix x0 y0