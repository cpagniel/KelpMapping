%% Set Current Species Code

ix = gco;
PARAMS.icur = str2double(ix.String(1:2));

set(MAIN.hstatus10,'str',char(PARAMS.sfull(PARAMS.icur,:)));
set(MAIN.hstatus10,'backg',PARAMS.scol(PARAMS.icur,:));

%% Get Click Point

MAIN.cnt = MAIN.cnt+1;

h = imfreehand();
h.setColor(PARAMS.scol(PARAMS.icur,:));

DATA.pos(MAIN.cnt) = {h.getPosition()};

DATA.XX{MAIN.cnt} = DATA.pos{MAIN.cnt}(:,1);
DATA.YY{MAIN.cnt} = DATA.pos{MAIN.cnt}(:,2);

%% Update Count

DATA.COUNT(PARAMS.icur) = DATA.COUNT(PARAMS.icur)+1;

x0 = 0.50; y0 = 1.00;
if PARAMS.icur >= PARAMS.icntmax
    x0 = x0 + 0.10;
    y0 = y0 - 0.02*(PARAMS.icur-PARAMS.icntmax+1);
else
    y0 = y0 - 0.02*(PARAMS.icur);
end

if PARAMS.icur < 20
    MAIN.hu3(PARAMS.icur) = uicontrol(MAIN.hf1,'un','n','style','tex','pos',[x0+0.06 y0 .03 .02], ...
            'str',num2str(DATA.COUNT(PARAMS.icur)),'tag','hu','fontsize',9,'fontweight','b',...
            'backgroundcolor',PARAMS.scol(PARAMS.icur,:),'foregroundcolor','w');
else
MAIN.hu3(PARAMS.icur) = uicontrol(MAIN.hf1,'un','n','style','tex','pos',[x0+0.06 y0 .03 .02], ...
    'str',num2str(DATA.COUNT(PARAMS.icur)),'tag','hu','fontsize',9,'fontweight','b',...
    'backgroundcolor',PARAMS.scol(PARAMS.icur,:));
end

clear h ix x0 y0