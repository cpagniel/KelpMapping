%% Load Data

load('ALL_bathy.mat');
load('ALL_GPS_DEPTH.mat');

%% Plot 3D - All

figure('units','pixels','position',[680 432 730 666]);
s = surf(X,Y,-1*Z,'FaceAlpha',0.5);
s.EdgeColor = 'none';
cmap = colormap(gray(100)); h = colorbar; caxis([-55 0]); ylabel(h,'Depth (m)');
hold on
set(gca,'zdir','normal');

for i = 1:length(Mpyr_GPS_total)
    h1 = fill3(Mpyr_GPS_total{i}(:,1),Mpyr_GPS_total{i}(:,2),-1*Mpyr_DEPTH_total{i},[0.93 0.69 0.13],'LineStyle','none');
    hold on
end
for i = 1:length(Ppor_GPS_total)
    h2 = fill3(Ppor_GPS_total{i}(:,1),Ppor_GPS_total{i}(:,2),-1*Ppor_DEPTH_total{i},[0.49 0.18 0.56],'LineStyle','none');
    hold on
end
for i = 1:length(Ugui_GPS_total)
    h3 = fill3(Ugui_GPS_total{i}(:,1),Ugui_GPS_total{i}(:,2),-1*Ugui_DEPTH_total{i},[0.3 0.75 0.93],'LineStyle','none');
    hold on
end
for i = 1:length(Emen_GPS_total)
    h4 = fill3(Emen_GPS_total{i}(:,1),Emen_GPS_total{i}(:,2),-1*Emen_DEPTH_total{i},[0.47 0.67 0.19],'LineStyle','none');
    hold on
end
lgd = legend([h1 h2 h3 h4],'Macrocystis pyrifera','Pelagophycus porra','Understory guilds','Egregia menziesii','Location','NorthEast');

clear i

xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)'); zlabel('Depth (m)');
zlim([-55 0]);

saveas(gcf,'3D_kelp_bathy_all.fig');
saveas(gcf,'3D_kelp_bathy_all.png');

% OptionZ.FrameRate=15; OptionZ.Duration=10; OptionZ.Periodic=true;
% CaptureFigVid([-20,10;-110,10;-190,80;-290,10;-380,10],'3D_kelp_bathy',OptionZ)

%% Plot 2D - All

figure('units','pixels','position',[680 432 730 666]);

m_proj('albers equal-area','long',[-117.3333 -117.2583],'lat',[32.79167 32.85833],'rectbox','on');

hold on

bndry_lon = [-117.3208 -117.3208 -117.2799 -117.2799];
bndry_lat = [32.8169 32.8347 32.8347 32.8169];
m_patch(bndry_lon,bndry_lat,[0.8 0.8 0.8],'edgecolor','none');

hold on

m_gshhs_f('patch',[1 1 1]); % Coastline
m_grid('linewi',2,'linest','none','tickdir','out','xaxisloc','bottom','yaxisloc','right','fontsize',12);

hold on

for i = 1:length(Mpyr_GPS_total)
    m_plot(Mpyr_GPS_total{i}(:,1),Mpyr_GPS_total{i}(:,2),'.','MarkerSize',2,'Color',[0.93 0.69 0.13]);
    hold on
end
for i = 1:length(Ppor_GPS_total)
    m_plot(Ppor_GPS_total{i}(:,1),Ppor_GPS_total{i}(:,2),'.','MarkerSize',2,'Color',[0.49 0.18 0.56]);
    hold on
end
for i = 1:length(Ugui_GPS_total)
    m_plot(Ugui_GPS_total{i}(:,1),Ugui_GPS_total{i}(:,2),'.','MarkerSize',2,'Color',[0.3 0.75 0.93]);
    hold on
end
for i = 1:length(Emen_GPS_total)
     m_plot(Emen_GPS_total{i}(:,1),Emen_GPS_total{i}(:,2),'.','MarkerSize',2,'Color',[0.47 0.67 0.19]);
    hold on
end

hold on

s = m_contour(X,Y,-1*Z,-60:5:0,'ShowText','on','LineColor','w');

hold on

m_ruler([.8 1],.1,1,'fontsize',8);

h1 = plot(0,0,'.','MarkerSize',12,'Color',[0.93 0.69 0.13]);
h2 = plot(0,0,'.','MarkerSize',12,'Color',[0.49 0.18 0.56]);
h3 = plot(0,0,'.','MarkerSize',12,'Color',[0.3 0.75 0.93]);
h4 = plot(0,0,'.','MarkerSize',12,'Color',[0.47 0.67 0.19]);
lgd = legend([h1 h2 h3 h4],'Macrocystis pyrifera','Pelagophycus porra','Understory guilds','Egregia menziesii','Location','NorthWest');
lgd.FontSize = 12;

clear i

% xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)');

saveas(gcf,'2D_kelp_bathy_all.fig');
saveas(gcf,'2D_kelp_bathy_all.png');

%% Plot 3D - Mpyr

figure('units','pixels','position',[680 432 730 666]);
s = surf(X,Y,-1*Z,'FaceAlpha',0.5);
s.EdgeColor = 'none';
cmap = colormap(gray(100)); h = colorbar; caxis([-55 0]); ylabel(h,'Depth (m)');
hold on
set(gca,'zdir','normal');

for i = 1:length(Mpyr_GPS_total)
    h1 = fill3(Mpyr_GPS_total{i}(:,1),Mpyr_GPS_total{i}(:,2),-1*Mpyr_DEPTH_total{i},[0.93 0.69 0.13],'LineStyle','none');
    hold on
end

clear i

xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)'); zlabel('Depth (m)');
zlim([-55 0]);

saveas(gcf,'3D_Mpyr_bathy_all.fig');
saveas(gcf,'3D_Mpyr_bathy_all.png');

% OptionZ.FrameRate=15; OptionZ.Duration=10; OptionZ.Periodic=true;
% CaptureFigVid([-20,10;-110,10;-190,80;-290,10;-380,10],'3D_kelp_bathy',OptionZ)

%% Plot 2D - Mpyr

figure('units','pixels','position',[680 432 730 666]);

m_proj('albers equal-area','long',[-117.3333 -117.2583],'lat',[32.79167 32.85833],'rectbox','on');

hold on

bndry_lon = [-117.3208 -117.3208 -117.2799 -117.2799];
bndry_lat = [32.8169 32.8347 32.8347 32.8169];
m_patch(bndry_lon,bndry_lat,[0.8 0.8 0.8],'edgecolor','none');

hold on

m_gshhs_f('patch',[1 1 1]); % Coastline
m_grid('linewi',2,'linest','none','tickdir','out','xaxisloc','bottom','yaxisloc','right','fontsize',12);

hold on

for i = 1:length(Mpyr_GPS_total)
    m_plot(Mpyr_GPS_total{i}(:,1),Mpyr_GPS_total{i}(:,2),'.','MarkerSize',2,'Color',[0.93 0.69 0.13]);
    hold on
end

hold on

s = m_contour(X,Y,-1*Z,-60:5:0,'ShowText','on','LineColor','w');

hold on

m_ruler([.8 1],.1,1,'fontsize',8);

clear i

% xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)');

saveas(gcf,'2D_Mpyr_bathy_all.fig');
saveas(gcf,'2D_Mpyr_bathy_all.png');

%% Plot 3D - Ppor

figure('units','pixels','position',[680 432 730 666]);
s = surf(X,Y,-1*Z,'FaceAlpha',0.5);
s.EdgeColor = 'none';
cmap = colormap(gray(100)); h = colorbar; caxis([-55 0]); ylabel(h,'Depth (m)');
hold on
set(gca,'zdir','normal');

for i = 1:length(Ppor_GPS_total)
    h2 = fill3(Ppor_GPS_total{i}(:,1),Ppor_GPS_total{i}(:,2),-1*Ppor_DEPTH_total{i},[0.49 0.18 0.56],'LineStyle','none');
    hold on
end

clear i

xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)'); zlabel('Depth (m)');
zlim([-55 0]);

saveas(gcf,'3D_Ppor_bathy_all.fig');
saveas(gcf,'3D_Ppor_bathy_all.png');

% OptionZ.FrameRate=15; OptionZ.Duration=10; OptionZ.Periodic=true;
% CaptureFigVid([-20,10;-110,10;-190,80;-290,10;-380,10],'3D_kelp_bathy',OptionZ)

%% Plot 2D - Ppor

figure('units','pixels','position',[680 432 730 666]);

m_proj('albers equal-area','long',[-117.3333 -117.2583],'lat',[32.79167 32.85833],'rectbox','on');

hold on

bndry_lon = [-117.3208 -117.3208 -117.2799 -117.2799];
bndry_lat = [32.8169 32.8347 32.8347 32.8169];
m_patch(bndry_lon,bndry_lat,[0.8 0.8 0.8],'edgecolor','none');

hold on

m_gshhs_f('patch',[1 1 1]); % Coastline
m_grid('linewi',2,'linest','none','tickdir','out','xaxisloc','bottom','yaxisloc','right','fontsize',12);

hold on

for i = 1:length(Ppor_GPS_total)
    m_plot(Ppor_GPS_total{i}(:,1),Ppor_GPS_total{i}(:,2),'.','MarkerSize',2,'Color',[0.49 0.18 0.56]);
    hold on
end

hold on

s = m_contour(X,Y,-1*Z,-60:5:0,'ShowText','on','LineColor','w');

hold on

m_ruler([.8 1],.1,1,'fontsize',8);

clear i

% xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)');

saveas(gcf,'2D_Ppor_bathy_all.fig');
saveas(gcf,'2D_Ppor_bathy_all.png');

%% Plot 3D - Ugui

figure('units','pixels','position',[680 432 730 666]);
s = surf(X,Y,-1*Z,'FaceAlpha',0.5);
s.EdgeColor = 'none';
cmap = colormap(gray(100)); h = colorbar; caxis([-55 0]); ylabel(h,'Depth (m)');
hold on
set(gca,'zdir','normal');

for i = 1:length(Ugui_GPS_total)
    h3 = fill3(Ugui_GPS_total{i}(:,1),Ugui_GPS_total{i}(:,2),-1*Ugui_DEPTH_total{i},[0.3 0.75 0.93],'LineStyle','none');
    hold on
end

clear i

xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)'); zlabel('Depth (m)');
zlim([-55 0]);

saveas(gcf,'3D_Ugui_bathy_all.fig');
saveas(gcf,'3D_Ugui_bathy_all.png');

% OptionZ.FrameRate=15; OptionZ.Duration=10; OptionZ.Periodic=true;
% CaptureFigVid([-20,10;-110,10;-190,80;-290,10;-380,10],'3D_kelp_bathy',OptionZ)

%% Plot 2D - Ugui

figure('units','pixels','position',[680 432 730 666]);

m_proj('albers equal-area','long',[-117.3333 -117.2583],'lat',[32.79167 32.85833],'rectbox','on');

hold on

bndry_lon = [-117.3208 -117.3208 -117.2799 -117.2799];
bndry_lat = [32.8169 32.8347 32.8347 32.8169];
m_patch(bndry_lon,bndry_lat,[0.8 0.8 0.8],'edgecolor','none');

hold on

m_gshhs_f('patch',[1 1 1]); % Coastline
m_grid('linewi',2,'linest','none','tickdir','out','xaxisloc','bottom','yaxisloc','right','fontsize',12);

hold on

for i = 1:length(Ugui_GPS_total)
    m_plot(Ugui_GPS_total{i}(:,1),Ugui_GPS_total{i}(:,2),'.','MarkerSize',2,'Color',[0.3 0.75 0.93]);
    hold on
end

hold on

s = m_contour(X,Y,-1*Z,-60:5:0,'ShowText','on','LineColor','w');

hold on

m_ruler([.8 1],.1,1,'fontsize',8);

clear i

% xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)');

saveas(gcf,'2D_Ugui_bathy_all.fig');
saveas(gcf,'2D_Ugui_bathy_all.png');

%% Plot 3D - Emen

figure('units','pixels','position',[680 432 730 666]);
s = surf(X,Y,-1*Z,'FaceAlpha',0.5);
s.EdgeColor = 'none';
cmap = colormap(gray(100)); h = colorbar; caxis([-55 0]); ylabel(h,'Depth (m)');
hold on
set(gca,'zdir','normal');

for i = 1:length(Emen_GPS_total)
    h4 = fill3(Emen_GPS_total{i}(:,1),Emen_GPS_total{i}(:,2),-1*Emen_DEPTH_total{i},[0.47 0.67 0.19],'LineStyle','none');
    hold on
end

clear i

xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)'); zlabel('Depth (m)');
zlim([-55 0]);

saveas(gcf,'3D_Emen_bathy_all.fig');
saveas(gcf,'3D_Emen_bathy_all.png');

% OptionZ.FrameRate=15; OptionZ.Duration=10; OptionZ.Periodic=true;
% CaptureFigVid([-20,10;-110,10;-190,80;-290,10;-380,10],'3D_kelp_bathy',OptionZ)

%% Plot 2D - Emen

figure('units','pixels','position',[680 432 730 666]);

m_proj('albers equal-area','long',[-117.3333 -117.2583],'lat',[32.79167 32.85833],'rectbox','on');

hold on

bndry_lon = [-117.3208 -117.3208 -117.2799 -117.2799];
bndry_lat = [32.8169 32.8347 32.8347 32.8169];
m_patch(bndry_lon,bndry_lat,[0.8 0.8 0.8],'edgecolor','none');

hold on

m_gshhs_f('patch',[1 1 1]); % Coastline
m_grid('linewi',2,'linest','none','tickdir','out','xaxisloc','bottom','yaxisloc','right','fontsize',12);

hold on

for i = 1:length(Emen_GPS_total)
     m_plot(Emen_GPS_total{i}(:,1),Emen_GPS_total{i}(:,2),'.','MarkerSize',2,'Color',[0.47 0.67 0.19]);
    hold on
end

hold on

s = m_contour(X,Y,-1*Z,-60:5:0,'ShowText','on','LineColor','w');

hold on

m_ruler([.8 1],.1,1,'fontsize',8);

clear i

% xlabel('Longitude (\circW)'); ylabel('Latitude (\circN)');

saveas(gcf,'2D_Emen_bathy_all.fig');
saveas(gcf,'2D_Emen_bathy_all.png');