figure;
for i = 1:length(Mpyr_GPS)
    fill3(Mpyr_GPS{i}(:,1),Mpyr_GPS{i}(:,2),Mpyr_DEPTH{i},'g','LineStyle','none');
    hold on
end
set(gca,'zdir','reverse');

figure;
for i = 1:length(Ppor_GPS)
    fill3(Ppor_GPS{i}(:,1),Ppor_GPS{i}(:,2),Ppor_DEPTH{i},'r','LineStyle','none');
    hold on
end
set(gca,'zdir','reverse');

figure;
for i = 1:length(Ugui_GPS)
    fill3(Ugui_GPS{i}(:,1),Ugui_GPS{i}(:,2),Ugui_DEPTH{i},'b','LineStyle','none');
    hold on
end
set(gca,'zdir','reverse');

figure;
for i = 1:length(Emen_GPS)
    fill3(Emen_GPS{i}(:,1),Emen_GPS{i}(:,2),Emen_DEPTH{i},'k','LineStyle','none');
    hold on
end
set(gca,'zdir','reverse');

%% All

figure;
for i = 1:length(Mpyr_GPS)
    fill3(Mpyr_GPS{i}(:,1),Mpyr_GPS{i}(:,2),Mpyr_DEPTH{i},'g','LineStyle','none');
    hold on
end
for i = 1:length(Ppor_GPS)
    fill3(Ppor_GPS{i}(:,1),Ppor_GPS{i}(:,2),Ppor_DEPTH{i},'r','LineStyle','none');
    hold on
end
for i = 1:length(Ugui_GPS)
    fill3(Ugui_GPS{i}(:,1),Ugui_GPS{i}(:,2),Ugui_DEPTH{i},'b','LineStyle','none');
    hold on
end
for i = 1:length(Emen_GPS)
    fill3(Emen_GPS{i}(:,1),Emen_GPS{i}(:,2),Emen_DEPTH{i},'k','LineStyle','none');
    hold on
end
set(gca,'zdir','reverse');

clear i