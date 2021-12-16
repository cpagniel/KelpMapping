%% Set Parameters

DATA.DATE=get(PARAMS.hidate,'str');
DATA.TIME=get(PARAMS.hitime,'str');
DATA.FILENAME=get(PARAMS.hiname,'str');
DATA.MAX_DEPTH=get(PARAMS.himaxdepth,'str');

set(PARAMS.hidate,'en','off')
set(PARAMS.hitime,'en','off')
set(PARAMS.hiname,'en','off')
set(PARAMS.himaxdepth,'en','off')

set(MAIN.hf1,MAIN.wbd,'',MAIN.wbm,'',MAIN.wbu,'');
set(MAIN.hu1,'en','on')

%% Zoom Based on Depth from GPS Track

% Get Bottom Depth XYZ data from .csv file
%PARAMS.gpsdir = uigetdir([pwd '\*.png'],'Select Directory of GPS XYZ Data .csv File');
%cd(PARAMS.gpsdir)
%cd('G:\Kelp_mapping\RSD')

PARAMS.bottom_depth = csvread([PARAMS.ifile(1:4) '.RSD.XYZ.csv'],1,2);
file_start = datestr(seconds(str2double(PARAMS.ifile(15:16))*3600+str2double(PARAMS.ifile(17:18))*60+str2double(PARAMS.ifile(19:20))),'HH:MM:SS');
PARAMS.bottom_time = datenum(file_start):1.1574e-05:datenum(file_start)+(length(PARAMS.bottom_depth)-1)*1.1574e-05;

clear file_start

for i = 1:length(PARAMS.bottom_depth)
    if strcmp(datestr(PARAMS.bottom_time(i),'HH:MM:SS'),DATA.TIME) == 1
        DATA.BOTTOM_DEPTH = PARAMS.bottom_depth(i:i+27-1);
    end
end

cd(PARAMS.idir);

%% Load Image

MAIN.hi1 = imagesc(linspace(0,27,150),linspace(0,str2double(DATA.MAX_DEPTH),2048),DATA.IMG);
xlabel('Time from Start of Img File (s)'); ylabel('Depth (m)');

ylim([-6 ceil(max(DATA.BOTTOM_DEPTH))]);
PARAMS.hiylimmin=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .536 .085 .032], ...
    'str',min(ylim),'foreg',[0 0 1],'backg',[1 1 1]);
PARAMS.hiylimmax=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .504 .085 .032], ...
    'str',max(ylim),'foreg',[0 0 1],'backg',[1 1 1]);

colormap(jet);
caxis([0 80]);

MAIN.hp1 = get(MAIN.ha1,'Position');
set(MAIN.ha1,'Position',MAIN.hp1+0.05);
set(MAIN.ha1,'dataaspectratio',[1 1 1]);
set(MAIN.ha1,'xgr','on','ygr','on');