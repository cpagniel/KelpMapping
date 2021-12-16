%% Kelp Processing v.5
% Author: C Pagniello
% Original: Oct 2018
% Last Edit: December 12 2019

if ~exist('PARAMS','var')
    clear
    clc
    close all
    warning('off');
else
    clc
    close all
    warning('off');
end

%% Create Main Window

MAIN.verno=' Kelp Processing v.5';

MAIN.wbd='WindowButtonDown';
MAIN.wbm='WindowButtonMotion';
MAIN.wbu='WindowButtonUp';

MAIN.snsize = 12;
MAIN.visval = 'off';

MAIN.cnt = 0;

MAIN.hf1 = figure('units','normalized','outerposition',[0.05 0.05 .90 .90],'KeyPressFcn','keyPressed');
MAIN.figsize = get(gcf,'Position');
MAIN.figwidth = MAIN.figsize(3);
MAIN.figheight = MAIN.figsize(4);


set(MAIN.hf1,'numb','off');
set(MAIN.hf1,'pointer','crosshair','name',MAIN.verno);
set(MAIN.hf1,'menubar','none');

PARAMS.idate='enter date';
PARAMS.itime='enter time';
PARAMS.iname='enter filename';
PARAMS.imaxdepth='enter max depth';
PARAMS.iqual='enter picture quality';
PARAMS.comments='enter comments here';

%% Create Controls

% File Menu

MAIN.control.hmen3=uimenu(MAIN.hf1,'Label','File');
MAIN.control.hmen3a=uimenu(MAIN.control.hmen3,'Label','Save DATA','sep','on','call','savedata;disp(''Data have been saved.'')');
MAIN.control.hmen3b=uimenu(MAIN.control.hmen3,'Label','SAVE DATA and Select to Next Image','call','savedatanext;disp(''Data have been saved.'')');
MAIN.control.hmen3d=uimenu(MAIN.control.hmen3,'Label','SAVE DATA and Load Next Image','call','savedataload;disp(''Data has been saved.'')');
MAIN.control.hmen3c=uimenu(MAIN.control.hmen3,'Label','Quit','call','delete(MAIN.hf1)');

% % % For Matlab 2018b
% MAIN.control.hmen3=uimenu(MAIN.hf1,'Label','File');
% MAIN.control.hmen3a=uimenu(MAIN.control.hmen3,'Label','Save DATA','sep','on','MenuSelectedFcn','savedata;disp(''Data have been saved.'')');
% MAIN.control.hmen3b=uimenu(MAIN.control.hmen3,'Label','SAVE DATA and Select to Next Image','MenuSelectedFcn','savedatanext;disp(''Data have been saved.'')');
% MAIN.control.hmen3d=uimenu(MAIN.control.hmen3,'Label','SAVE DATA and Load Next Image','MenuSelectedFcn','savedataload;disp(''Data has been saved.'')');
% MAIN.control.hmen3c=uimenu(MAIN.control.hmen3,'Label','Quit','MenuSelectedFcn','delete(MAIN.hf1)');

% Image Parameters
MAIN.control.hsetparams=uicontrol(MAIN.hf1,'style','push','un','n','pos',[.900 .806 .100 .024],...
    'str','Image Parameters','call','setparams');
PARAMS.hidate=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .774 .085 .032], ...
    'str',PARAMS.idate,'foreg',[0 0 1],'backg',[1 1 1]);
MAIN.control.hidatex=uicontrol(MAIN.hf1,'style','text','un','n','pos',[.892 .774 .023 .032], ...
    'str','Date','foreg',[0 0 0],'backg',[.8 1 1]);
PARAMS.hitime=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .742 .085 .032], ...
    'str',PARAMS.itime,'foreg',[0 0 1],'backg',[1 1 1]);
MAIN.control.hitimex=uicontrol(MAIN.hf1,'style','text','un','n','pos',[.892 .742 .023 .032], ...
    'str','Time','foreg',[0 0 0],'backg',[.8 1 1]);
PARAMS.hiname=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .710 .085 .032], ...
    'str',PARAMS.iname,'foreg',[0 0 1],'backg',[1 1 1]);
MAIN.control.hinamex=uicontrol(MAIN.hf1,'style','text','un','n','pos',[.885 .710 .030 .032], ...
    'str','Filename','foreg',[0 0 0],'backg',[.8 1 1]);
PARAMS.himaxdepth=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .678 .085 .032], ...
    'str',PARAMS.imaxdepth,'foreg',[0 0 1],'backg',[1 1 1]);
MAIN.control.himaxdepthx=uicontrol(MAIN.hf1,'style','text','un','n','pos',[.870 .678 .045 .032], ...
    'str','Max Depth','foreg',[0 0 0],'backg',[.8 1 1]);
PARAMS.hiqual=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .646 .085 .032], ...
    'str',PARAMS.iqual,'foreg',[0 0 1],'backg',[1 1 1]);
MAIN.control.hiqual=uicontrol(MAIN.hf1,'style','text','un','n','pos',[.870 .646 .045 .032], ...
    'str','Picture Quality','foreg',[0 0 0],'backg',[.8 1 1]);

% Y Limit
MAIN.control.hsetylim=uicontrol(MAIN.hf1,'style','push','un','n','pos',[.900 .568 .100 .024],...
    'str','Y Limits','call','setylim');
PARAMS.hiylimmin=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .536 .085 .032], ...
    'str',0,'foreg',[0 0 1],'backg',[1 1 1]);
MAIN.control.hiylimin=uicontrol(MAIN.hf1,'style','text','un','n','pos',[.870 .536 .045 .032], ...
    'str','Min Y Limit','foreg',[0 0 0],'backg',[.8 1 1]);
PARAMS.hiylimmax=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .504 .085 .032], ...
    'str',0,'foreg',[0 0 1],'backg',[1 1 1]);
MAIN.control.hiylimax=uicontrol(MAIN.hf1,'style','text','un','n','pos',[.870 .504 .045 .032], ...
    'str','Max Y Limit','foreg',[0 0 0],'backg',[.8 1 1]);

% Status Bar
MAIN.hstatus10=uicontrol(MAIN.hf1,'style','text','un','n','pos',[.125 .0 .324 .020], ...
    'foreg',[0 0 0],'backg',[1 1 .75],'str','species');

% Comments
MAIN.control.hicommentsx=uicontrol(MAIN.hf1,'style','text','un','n','pos',[0.7 0.4 .050 .032], ...
    'str','Comments','foreg',[0 0 0],'backg',[.8 1 1]);
PARAMS.hicomments=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[0.7 0.01 0.3 0.38], ...
    'str',PARAMS.comments,'foreg',[0 0 1],'backg',[1 1 1]);

%% Get Image Path

if ~isfield(PARAMS,'ifile')
    [PARAMS.ifile,PARAMS.idir] = uigetfile([pwd '\*.png'],'Select Image File');
    PARAMS.ipath = [PARAMS.idir PARAMS.ifile];
    if PARAMS.ifile ~= 0
        cd(PARAMS.idir);
        PARAMS.files = dir('*.png');
    else
        close all
        uiwait(msgbox('User canceled file selection - program terminates','Kelp Processing'));
        return
    end
else
    PARAMS.ipath = [PARAMS.idir PARAMS.ifile];
end

%% Get GPS Track

PARAMS.GPS = csvread([PARAMS.ifile(1:4) '.RSD.XYZ.csv'],1,0);
PARAMS.bottom_depth = abs(csvread([PARAMS.ifile(1:4) '.RSD.XYZ.csv'],1,2));
PARAMS.bottom_ping = str2double(PARAMS.ifile(end-8:end-6))*150+1:str2double(PARAMS.ifile(end-8:end-6))*150+150;

DATA.BOTTOM_DEPTH = PARAMS.bottom_depth(PARAMS.bottom_ping);
DATA.GPS = PARAMS.GPS(PARAMS.bottom_ping,1:2);

DATA.PING = linspace(0,26.5374,150);
DATA.DEPTH = linspace(0,str2double(PARAMS.ifile(22:25)),2048);

%% Load Image

[DATA.IMG,DATA.CMAP] = imread(PARAMS.ipath);

[MAIN.iheight,MAIN.iwidth] = size(DATA.IMG(1:ceil(ceil(max(DATA.BOTTOM_DEPTH))/diff(DATA.DEPTH(1:2))),:));
MAIN.aspratio = MAIN.iwidth/MAIN.iheight;

MAIN.scrsize = get(0,'screensize');
MAIN.xmen = MAIN.figwidth*MAIN.scrsize(3);
MAIN.ymen = MAIN.figheight*MAIN.scrsize(4);
MAIN.imagepart = MAIN.ymen/MAIN.xmen;

MAIN.ha1 = axes('units','norm','pos',[0.03 0.06 MAIN.imagepart 0.9]);

MAIN.hi1 = imagesc(DATA.PING,DATA.DEPTH,DATA.IMG);
% MAIN.hi1 = imagesc(DATA.PING,DATA.DEPTH(1:ceil(ceil(max(DATA.BOTTOM_DEPTH))/diff(DATA.DEPTH(1:2)))),DATA.IMG(1:ceil(ceil(max(DATA.BOTTOM_DEPTH))/diff(DATA.DEPTH(1:2))),:));
xlabel('Time from Start of Img File (s)'); ylabel('Depth (m)');
colormap(jet);
caxis([0 80]);

%set(MAIN.ha1,'dataaspectratio',[1 1 1]);
set(MAIN.ha1,'xgr','on','ygr','on');
set(MAIN.ha1,'XTickLabel',[])
% set(MAIN.ha1,'YTickLabel',[])

ylim([0 ceil(max(DATA.BOTTOM_DEPTH))]);

%% Load Species

load('species.mat');

PARAMS.scode = scode;
PARAMS.scol = scol;
PARAMS.sfull = sfull;
PARAMS.snumb = snumb;

clear scode scol sfull snumb

%% Create Species Buttons

[PARAMS.nspec,~] = size(PARAMS.sfull);

MAIN.hu1 = zeros(1,PARAMS.nspec);
MAIN.hu3 = zeros(1,PARAMS.nspec);
DATA.COUNT = zeros(1,PARAMS.nspec);

icnt = 0;
PARAMS.icntmax = 50;
x0 = 0.75; y0 = 0.75;

for i = 1:PARAMS.nspec
    
    icnt = icnt + 1;
    y0 = y0 - .02;
    
    MAIN.hu1(i) = uicontrol(MAIN.hf1,'un','n','style','push','pos',[x0  y0 .06 .02], ...
        'string',[num2str(PARAMS.snumb(i)) ' ' char(PARAMS.scode(i,:))],'foregroundcolor','w', ...
        'backgroundcolor',PARAMS.scol(i,:), 'tag','hu','user',i,'callback','sclick;');
    
    MAIN.hu3(i) = uicontrol(MAIN.hf1,'un','n','style','tex','pos',[x0+0.06 y0 .03 .02], ...
        'str',num2str(DATA.COUNT(i)),'tag','hu','fontsize',9,'fontweight','b',...
        'backgroundcolor',PARAMS.scol(i,:),'foregroundcolor','w');
end

clear icnt x0 y0 i

%% Get Image Parameters

PARAMS.hidate=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .774 .085 .032], ...
    'str',datestr(datenum(PARAMS.ifile(6:13),'MMDDYYYY'),'MM/DD/YYYY'),'foreg',[0 0 1],'backg',[1 1 1]);
PARAMS.hitime=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .742 .085 .032], ...
    'str',datestr(seconds(str2double(PARAMS.ifile(15:16))*3600+str2double(PARAMS.ifile(17:18))*60+...
    str2double(PARAMS.ifile(19:20))+26.5374*str2double(PARAMS.ifile(end-8:end-6))),'HH:MM:SS'),'foreg',[0 0 1],'backg',[1 1 1]);
PARAMS.hiname=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .710 .085 .032], ...
    'str',PARAMS.ifile,'foreg',[0 0 1],'backg',[1 1 1]);
PARAMS.himaxdepth=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .678 .085 .032], ...
    'str',PARAMS.ifile(22:25),'foreg',[0 0 1],'backg',[1 1 1]);
PARAMS.hiylimmin=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .536 .085 .032], ...
    'str',min(ylim),'foreg',[0 0 1],'backg',[1 1 1]);
PARAMS.hiylimmax=uicontrol(MAIN.hf1,'style','edit','un','n','pos',[.915 .504 .085 .032], ...
    'str',max(ylim),'foreg',[0 0 1],'backg',[1 1 1]);

%% Set Processing Off Until Image Parameters Set

set(MAIN.hf1,MAIN.wbd,'',MAIN.wbm,'',MAIN.wbu,'');
set(MAIN.hu1,'en','off')
