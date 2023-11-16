close all;clear all;clc;
%% load data for figure 1
% tic
load fig1.mat 
% gmhw_freq_trend - A 2D numeric matrix (m-by-n) containing the linear trend 
% of global annual MHW frequency during 1982-2021
% gmhw_freq_p - A 2D numeric matrix (m-by-n) containing p value of the linear trend.
% gsmhw_freq_trend - A 2D numeric matrix (m-by-n) containing the linear trend 
% of global annual weekly-biweekly MHW (duration within 5-15 days) frequency during 1982-2021
% tfreq_ratio -probability of MHWs with different durations (5-15;15-30;30-60;>=60) in the tropical
% oceans (180¡ãW-180¡ãE, 30¡ãS-30¡ãN) during 1982-2001 and 2002-2021, respectively
% gsmhw_freq_per - A 2D numeric matrix (m-by-n) containing the percentage of 
% the number of weekly-biweekly MHWs and the total number of MHWs during 1982-2021
% gssta_phstd_per - A 2D numeric matrix (m-by-n) containing the percentage of 
% high-frequency SSTa standard deviation and total SSTa standard deviation during 1982-2021
% tdur_sct - annual MHW duration in the tropical oceans (180¡ãW-180¡ãE, 30¡ãS-30¡ãN) 
% tfreq_sct - annual MHW frequency in the tropical oceans (180¡ãW-180¡ãE, 30¡ãS-30¡ãN) 
% tsmhw_freq_per_sct - percentage of the number of weekly-biweekly MHWs and 
% the total number of MHWs in the tropical oceans (180¡ãW-180¡ãE, 30¡ãS-30¡ãN) during 1982-2021
% tsmhw_freq_per_sct - percentage of high-frequency SSTa standard deviation and 
% total SSTa standard deviation in the tropical oceans (180¡ãW-180¡ãE, 30¡ãS-30¡ãN) during 1982-2021
% lon - longtitude in degree east 
% lat - latitude in degree north
% mycmap White-Blue-Green-Yellow-Red colors
% temp_19lev Blue-Red colors 
%% plot figure 1a
[x y]=meshgrid(lon,lat);
h1=axes('position',[0.06,0.7,0.54,0.28]);
cla
m_proj('Equidistant Cylindrical','lon',[0 360],'lat',[-60 60]);
m_contourf(x,y,gmhw_freq_trend',[-0.2:0.02:0.2],'linestyle','none');
shading flat
hold on
% a1=find(gmhw_freq_p'>=0.05);
% m_plot(x(a1),y(a1),'.','color','k','Markersize',1);
colormap(gca,temp_19lev)
h=colorbar('position',[0.62 0.74 0.01 0.2],'Ticks',[-0.2:0.1:0.2],'fontsize',8,'fontname','Arial')
set(get(h,'title'),'string','(count yr^{-1})','position',[35 45],'fontsize',8,'fontname','Arial','rotation',90);
m_coast('patch',[0.8 0.8 0.8]);
m_grid('linestyle','none','box','on','tirkdir','in','fontname','Arial',...
'fontsize',8,...
'xtick',[0:60:360],'Xticklabel',[0:60:360],...
'ytick',[-60:30:60],'Yticklabel',[-60:30:60],'linewidth',1);
% title('MHW Freq Trend','fontname','Arial',...
% 'fontsize',10,'color','k','fontweight','bold');
m_text(5,68,'a','fontname','Arial','fontweight','bold','fontsize',8,'color','k');
caxis([-0.2 0.2])
%% plot figure 1b
h2=axes('position',[0.76,0.73,0.22,0.22]);
scatter(tdur_sct,tfreq_sct,5,[0.1 0.1 0.1],'filled')
hold on
[r1,p1]=corr(tdur_sct,tfreq_sct)
set(gca,'xlim',[0 50]);
set(gca,'xtick',[0:10:50],'xticklabel',[0:10:50],'fontsize',8, ...
    'fontname','Arial');
set(gca,'ylim',[0.5 4]);
set(gca,'ytick',[0.5:1:4],'yticklabel',[0.5:1:4],'fontsize',8, ...
   'fontname','Arial');
xlabel('MHW Dur (day)','fontsize',8,'fontname','Arial')
ylabel('MHW Freq (count)','fontsize',8,'fontname','Arial')
text(24,3.5,['r=',num2str(roundn(r1,-2)),', p<0.05'],'fontname','Arial',...
'fontsize',8,'color','k');
text(1,4.2,'b','fontname','Arial','fontweight','bold','fontsize',8,'color','k');
set(gca,'linewidth',1)
box on
%% plot figure 1c
h3=axes('position',[0.06,0.38,0.54,0.28]);
cla
m_proj('Equidistant Cylindrical','lon',[0 360],'lat',[-60 60]);
m_contourf(x,y,gsmhw_freq_trend',[-0.2:0.02:0.2],'linestyle','none');
shading flat
hold on
% a1=find(gsmhw_freq_p'>=0.05);
% m_plot(x(a1),y(a1),'.','color','k','Markersize',1);
colormap(gca,temp_19lev)
h=colorbar('position',[0.62 0.42 0.01 0.2],'Ticks',[-0.2:0.1:0.2],'fontsize',8,'fontname','Arial')
set(get(h,'title'),'string','(count yr^{-1})','position',[35 45],'fontsize',8,'fontname','Arial','rotation',90);
m_coast('patch',[0.8 0.8 0.8]);
m_grid('linestyle','none','box','on','tirkdir','in','fontname','Arial',...
'fontsize',8,...
'xtick',[0:60:360],'Xticklabel',[0:60:360],...
'ytick',[-60:30:60],'Yticklabel',[-60:30:60],'linewidth',1);
% title('MHW(5-15d) Freq Trend','fontname','Arial',...
% 'fontsize',10,'color','k','fontweight','bold');
m_text(5,68,'c','fontname','Arial','fontweight','bold','fontsize',8,'color','k');
caxis([-0.2 0.2])
%% plot figure 1d
h4=axes('position',[0.76,0.41,0.22,0.22]);
h=bar(tfreq_ratio,'stacked','DisplayName','idurn_all')
set(h(1),'facecolor',temp_19lev(3,:))
set(h(2),'facecolor',temp_19lev(16,:))
set(gca,'xlim',[0 5]);
set(gca,'xtick',[1:1:4],'xticklabel',{'5-15','15-30','30-60','>=60'},'fontsize',8, ...
    'fontname','Arial');
set(gca,'ylim',[0 0.8]*100);
set(gca,'ytick',[0:0.2:0.8]*100,'yticklabel',[0:0.2:0.8]*100,'fontsize',8, ...
   'fontname','Arial');
text(0.1,86,'d','fontname','Arial','fontweight','bold','fontsize',8,'color','k');
text(0.65,55,'46%','fontname','Arial','fontsize',8,'color','k');
text(0.65,15,'28%','fontname','Arial','fontsize',8,'color','k');
xlabel('MHW Dur (day)','fontsize',8,'fontname','Arial')
ylabel('Probability (%)','fontsize',8,'fontname','Arial')
set(gca,'linewidth',1)
%% plot figure 1e
h5=axes('position',[0.06,0.06,0.54,0.28]);
cla
m_proj('Equidistant Cylindrical','lon',[0 360],'lat',[-60 60]);
m_contourf(x,y,gsmhw_freq_per',[40:5:100],'linestyle','none');
shading flat
hold on
m_contour(x,y,gssta_hpstd_pers',[0:5:50],'k','linestyle','-.','linewidth',1);
m_contour(x,y,gssta_hpstd_pers',[50:5:100],'k','linestyle','-','linewidth',1);
colormap(gca,mycmap)
h=colorbar('position',[0.62 0.10 0.01 0.2],'Ticks',[40:20:100],'fontsize',8,'fontname','Arial')
set(get(h,'title'),'string','(%)','position',[35 45],'fontsize',8,'fontname','Arial','rotation',90);
m_coast('patch',[0.8 0.8 0.8]);
m_grid('linestyle','none','box','on','tirkdir','in','fontname','Arial',...
'fontsize',8,...
'xtick',[0:60:360],'Xticklabel',[0:60:360],...
'ytick',[-60:30:60],'Yticklabel',[-60:30:60],'linewidth',1);
% title('N(MHWs_{D<=15d})/N(MHWs)','fontname','Arial',...
% 'fontsize',10,'color','k','fontweight','bold');
m_text(5,68,'e','fontname','Arial','fontweight','bold','fontsize',8,'color','k');
caxis([40 100])
set(gca,'linewidth',1.2)
%% plot figure 1f
h6=axes('position',[0.76,0.09,0.22,0.22]);
scatter(tssta_hpstd_per_sct,tsmhw_freq_per_sct,5,[0.1 0.1 0.1],'filled')
hold on
a=find(~isnan(tssta_hpstd_per_sct));
rc=tssta_hpstd_per_sct(a);
pc=tsmhw_freq_per_sct(a);
[r1,p1]=corr(rc,pc)
yp=polyfit(rc,pc,1);
y1=polyval(yp,[25:10:85]);
plot([25:10:85],y1,'color',mycmap(230,:),'linestyle','-','linewi',2)
set(gca,'xlim',[20 90]);
set(gca,'xtick',[20:20:90],'xticklabel',[20:20:90],'fontsize',8, ...
    'fontname','Arial');
set(gca,'ylim',[20 110]);
set(gca,'ytick',[20:20:110],'yticklabel',[20:20:110],'fontsize',8, ...
   'fontname','Arial');
xlabel('STD(SSTa_{F<90d})/STD(SST) (%)','fontsize',8,'fontname','Arial')
ylabel('N(MHWs_{D<=15d})/N(MHWs) (%)','fontsize',8,'fontname','Arial')
text(55,35,['r=',num2str(roundn(r1,-2)),', p<0.05'],'fontname','Arial',...
'fontsize',8,'color','k');
text(21,116,'f','fontname','Arial','fontweight','bold','fontsize',8,'color','k');
set(gca,'linewidth',1)
box on
% toc 
% Elapsed time is 18.317751 seconds.
%% print figure
set(gcf,'units','centimeters','Position',[1 1 18 15])
set(gcf,'paperunits','centimeters','PaperPosition',[0 0 18 15])
print('-depsc2','-r300','fig1')
%%

