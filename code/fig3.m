close all;clear all;clc;
%% *** fig3 Temporal evolutions of severe TCs number, MHWs frequency & SSTa ***
% tic
load fig3.mat
% co_num - annual averaged severe TCs number of Co-STC-MHW during 1982-2021
% no_num - annual averaged severe TCs number of No-STC-MHW during 1982-2021
% freq2 - annual averaged global tropical (30°S-30°N) MHW frequency during 1982-2021
% ssta3 - annual averaged global tropical (30°S-30°N) SSTa (�?) during 1982-2021
% ann_sstasum - annual averaged SSTa of severe TCs obtained from MHWs (STC-MHW-SSTa, �?)during 1982-2021
 
%% *** fig3a annual averaged severe TCs number of Co-STC-MHW & No-STC-MHW
figure;set(gcf,'pos',[518    95   648   788])
hh=subplot(3,1,1);set(hh,'pos',[0.1300    0.6793    0.7750    0.2157])
tc=[co_num; no_num];
h1=bar(1:40,co_num,'facecolor',[0 .45 .74],'edgecolor','w');hold on
h2=bar(1:40,no_num,0.4,'facecolor','r','edgecolor','w');
alpha(h1,0.4)
alpha(h2,0.4)

ylim([0 40])
set(gca,'xtick',[1:4:40],'xticklabel',[1982:4:2021],'fontname','Arial','fontsize',10)
ylabel('TCs #','fontname','Arial','fontsize',10)

yy=nanmean(co_num(1:20));
line([1 20],[yy yy],'color',[0.00,0.45,0.74],'LineStyle','-.','linewidth',1.5);
yy=nanmean(no_num(1:20));
line([1 20],[yy yy],'color',[0.85,0.33,0.10],'LineStyle','-.','linewidth',1.5);
yy=nanmean(co_num(21:40));
line([21 40],[yy yy],'color',[0.00,0.45,0.74],'LineStyle','-.','linewidth',1.5);
yy=nanmean(no_num(21:40));
line([21 40],[yy yy],'color',[0.85,0.33,0.10],'LineStyle','-.','linewidth',1.5);
 
fft1=['[',num2str(roundn(nanmean(co_num(1:20)),-2)),'/',num2str(roundn(nanmean(co_num(21:40)),-2)),']'];
fft2=['[',num2str(roundn(nanmean(no_num(1:20)),-2)),'/',num2str(roundn(nanmean(no_num(21:40)),-2)),']'];
text(15.5,35.5,fft1,'color',[0.00,0.45,0.74],'fontsize',10);
text(15.5,31.5,fft2,'color',[0.85,0.33,0.10],'fontsize',10);

hc=legend([h1,h2],'Co-STC-MHWs','No-STC-MHWs','location','northwest','fontname','Arial','fontsize',10);
set(hc,'box','off')
text(0.1,42,'a','fontname','Arial','fontsize',12,'fontweight','bold')

de=co_num-detrend(co_num);
p=polyfit(1:40,de,1);
t1=round(p(1)*10,2);
t2=round(std(de)/4,2);
ff1=['Trend=',num2str(t1),'±',num2str(t2),'(decade^{-1})']
text(22,35.5,ff1,'color',[0.00,0.45,0.74],'fontsize',10)

% V=co_num(1:40);alpha=0.01;[H,p_value]=Mann_Kendall_Modified(V,alpha)
%% *** fig3b MHWs Freq & TC-MHWs-SSTa during 1982-2021 ***
hold on
h1=subplot(3,1,2);set(h1,'pos',[0.1300    0.3996    0.7750    0.2157])
colororder({'k','r'})
yyaxis left

hc1=bar(1:40,ssta3(1:40),'FaceColor',[.65 .65 .65],'EdgeColor','none'); hold on
set(gca,'xtick',[1:4:40],'xticklabel',[1982:4:2021],'fontsize',10,'fontname','Arial')
set(gca,'YColor','k','ylim',[-0.8 0.8],'ytick',[-0.8:0.4:0.8],'yticklabel',[-0.8:0.4:0.8],'fontsize',10,'fontname','Arial')

xlim(h1,[0 41])
text(0.1,0.9,'b','fontsize',12,'fontname','Arial','fontweight','bold')
clear gssta lat latr lon lonr ssta1 t1 t2
ylabel('(°C)','fontsize',10,'fontname','Arial')

yyaxis right
ym=1.5;
x=1:40;
[ax,hc3,hc4]=plotyy(x,freq2,x,ann_sstasum);hold on
set(hc3,'linewidth',1.2)
set(hc4,'linewidth',1.2)
set(ax(1),'xtick',[1:4:40],'xticklabel',[1982:4:2021],'ylim',[0 5],'ytick',[0:1:5],'yticklabel',[],'fontsize',10,'fontname','Arial')
set(ax(2),'xtick',[],'xticklabel',[],'ylim',[0 ym],'ytick',[],'yticklabel',[])

pos=get(ax(1),'pos')
offset = pos(3)/8
posx = pos(3) - offset/2
pos2=[pos(1) pos(2) posx+offset pos(4)]

limx1=get(ax(1),'xlim')
limx2=[limx1(1)   limx1(1) + 1.2*(limx1(2)-limx1(1))]
ax(1)=axes('Position',pos,'box','off',...
   'Color','none','XColor','k','YColor','r',...   
   'xtick',[],'xticklabel',[],'xlim',limx1,'ylim',[0 5],'yaxislocation','right');
ax(2)=axes('Position',pos2,'box','off',...
   'Color','none','XColor','none','YColor',[0.00,0.45,0.74],...   
   'xtick',[],'xticklabel',[],'xlim',limx2,'ylim',[0 ym],'yaxislocation','right');
set(hc3,'color','r')
set(hc4,'color',[0.00,0.45,0.74])

set(ax(1),'ytick',[0:1:5],'yticklabel',[0:1:5],'fontsize',10,'fontname','Arial')
set(ax(2),'ytick',[0:ym/5:ym],'yticklabel',[0:ym/5:ym],'fontsize',10,'fontname','Arial')
yy1=ylabel(ax(1),'(Count)','fontsize',10,'fontname','Arial')
yy2=ylabel(ax(2),'(°C)','fontsize',10,'fontname','Arial')
set(yy1,'pos',[41    5.9    0])
set(yy2,'pos',[49.5    1.7    0])

[r p]=corrcoef(freq2,ann_sstasum,'Alpha',0.01)
text(37,0.2,['R(L1,L2)=',num2str(round(r(2),2))],'color','k','fontname','Arial','fontsize',10)

de=freq2-detrend(freq2);
p=polyfit(1:40,de,1);
t1=round(p(1)*10,2);
t2=round(std(de)/4,2);
ff2=['L1:MHWs Freq;Trend=',num2str(t1),'±',num2str(t2),' (Count\cdotdecade^{-1})']

de=ann_sstasum-detrend(ann_sstasum);
p=polyfit(1:40,de,1);
t1=round(p(1)*10,2);
t2=round(std(de)/4,2);
ff3=['L2:TC-MHWs-SSTa;Trend=',num2str(t1),'±',num2str(t2),' (\circC\cdotdecade^{-1})']

hc=legend([hc3 hc4],{ff2,ff3},...
    'location','northwest','fontname','Arial','FontSize',10)
set(hc,'box','off')
% toc
% Elapsed time is 3.627465 seconds.
%%