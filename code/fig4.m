close all;clear all;clc;
%% *** fig4 Temporal evolutions of air-sea factors for compound severe TCs & MHWs *** 
% tic
load fig4.mat
% the temporal evolutions of air-sea factors in TC main region (5°×5°) for the 298 Co-TC-MHW events during 1993-2021
% ttssta - SST anomalies (�?)
% twstc - TC maximum sustained wind speed (Kt)
% tdsa - MHWs area (km^2)
% ttchpa - tropical cyclone heat potential anomaly (kJ cm^2)
% tlhfa - latent heat flux anomaly (W m^2)
% tmlda - mixed layer depth anomaly (m)

%% *** fig4a normalized SSTa TC maximum sustained wind speed ***
figure;set(gcf,'pos',[544   282   767   536])
hc1=subplot(2,2,1);set(hc1,'pos',[0.1300    0.5838    0.3347    0.3412])
colororder([0 0 0; .3 .53 0])
yyaxis left
aa=ttssta;
bb=std(aa,0,2);cc=mean(bb);
for kk=1:size(aa,1)
    out(kk,:)=aa(kk,:)./cc;
end
mm=mean(out,1);
ss=std(out,0,1)./sqrt(size(ttssta,1)); % standard error

for ii=1:size(tdsa,1)
    [h1,p1,p2]=ttest(out(ii,:),mm,0.01);
    hh1(ii)=h1;
end

plot(mm','color','k','linestyle','-','linewidth',1.5);hold on
ls=1:4;
line([ls(end)+1 ls(end)+1],[-5 2],'color','b','linestyle','-.','linewidth',1);
line([ls(end)*3+1 ls(end)*3+1],[-5 2],'color','b','linestyle','-.','linewidth',1);
line([ls(end)*2+1 ls(end)*2+1],[-5 2],'color','b','linestyle','-.','linewidth',1);
ylim([-0.5 2.5])
xlim([1 size(tdsa,2)])
set(gca,'ytick',[-0.5:3/6:2.5],'yticklabel',[-0.5:3/6:2.5],'fontsize',10,'fontname','Arial')
set(gca,'xtick',[0:1:16],'xticklabel',{'','','','','','Genesis','','','','Peak','','','','Demise','',''},...
    'fontname','Arial','fontsize',10)
text(1,2.65,'a','fontname','Arial','fontsize',12,'fontweight','bold')
ylabel('(°C)','fontname','Arial','fontsize',10)

xx=1:size(ls,2)*4+1;
h1=fill([xx fliplr(xx)],[mm+ss fliplr(mm-ss)],[0.2 0.2 0.2]);hold on
set(h1,'edgealpha', 0, 'facealpha', 0.15);

clear out aa ss mm
yyaxis right
trang=5:13;
aa=twstc(:,trang).*(1.852/3.6); %% unit -> m/s

mm=mean(aa);
ss=std(aa)./sqrt(size(ttssta,1));

for ii=1:size(tdsa,1)
    [h1,p1,p2]=ttest(aa(ii,:),mm,0.01);
    hh2(ii)=h1;
end

mean_ws=nan(1,17);mean_ws(trang)=mm;
std_ws=nan(1,17);std_ws(trang)=ss;
plot(mean_ws','color',[.3 .53 0],'linestyle','-','linewidth',1.5);hold on
h2=fill([xx(trang) fliplr(xx(trang))],[mean_ws(trang)+std_ws(trang) fliplr(mean_ws(trang)-std_ws(trang))],[.3 .53 0]);
set(h2,'edgealpha', 0, 'facealpha', 0.15);
clear out aa ss mm
ylim([0 85])
set(gca,'ytick',[0:80/4:80],'yticklabel',[0:80/4:80],'fontsize',10,'fontname','Arial')

ff1=['6 days'];ff2=['6 days'];
text(5.5,5,ff1,'fontname','Arial','fontsize',9,'fontweight','bold')
text(9.5,5,ff2,'fontname','Arial','fontsize',9,'fontweight','bold')

t1=nanmean(nanmean(ttssta(:,5)));
t2=nanmean(nanmean(ttssta(:,9)));
t3=nanmean(nanmean(ttssta(:,13)));

text(4.1,81,num2str(round(t1,2)),'color','k','fontname','Arial','fontsize',10,'fontweight','bold')
text(8.1,81,num2str(round(t2,2)),'color','k','fontname','Arial','fontsize',10,'fontweight','bold')
text(12.1,81,num2str(round(t3,2)),'color','k','fontname','Arial','fontsize',10,'fontweight','bold')

t1=nanmean(nanmean(mean_ws(:,5)));
t2=nanmean(nanmean(mean_ws(:,9)));
t3=nanmean(nanmean(mean_ws(:,13)));

text(4.1,75,num2str(round(t1,2)),'color',[.3 .53 0],'fontname','Arial','fontsize',10,'fontweight','bold')
text(8.1,75,num2str(round(t2,2)),'color',[.3 .53 0],'fontname','Arial','fontsize',10,'fontweight','bold')
text(12.1,75,num2str(round(t3,2)),'color',[.3 .53 0],'fontname','Arial','fontsize',10,'fontweight','bold')
title('SST & Wind Speed','fontname','Arial','fontsize',10)
ylabel('(m\cdots^{-1})','fontname','Arial','fontsize',10)
%% *** fig4b normalized MHW area ***
h2=subplot(2,2,2);set(h2,'pos',[0.5894    0.5838    0.3347    0.3412])
colororder([1 0 0;0 0 0])
yyaxis left

aa=tdsa;
bb=std(aa,0,2);cc=mean(bb);
for kk=1:size(aa,1)
    out(kk,:)=aa(kk,:)./cc;
end
mm=mean(out,1);
ss=std(out,0,1)./sqrt(size(ttssta,1));

for ii=1:size(tdsa,1)
    [h1,p1,p2]=ttest(out(ii,:),mm,0.01);
    hh3(ii)=h1;
end

plot(mm','color','r','linestyle','-','linewidth',1.5);hold on
line([ls(end)+1 ls(end)+1],[-5 2.75],'color','b','linestyle','-.','linewidth',1.2);
line([ls(end)*3+1 ls(end)*3+1],[-5 2.75],'color','b','linestyle','-.','linewidth',1.2);
line([ls(end)*2+1 ls(end)*2+1],[-5 2.75],'color','b','linestyle','-.','linewidth',1.2);
ylim([0.5 3])
xlim([1 size(tdsa,2)])
set(gca,'ytick',[0.5:2.5/5:3],'yticklabel',[0.5:2.5/5:3],'fontsize',10,'fontname','Arial')
set(gca,'xtick',[0:1:16],'xticklabel',{'','','','','','Genesis','','','','Peak','','','','Demise','',''},...
    'fontname','Arial','fontsize',10)
text(1,3.11,'b','fontname','Arial','fontsize',12,'fontweight','bold')
ylabel('(10^5 km^2)','fontname','Arial','fontsize',10)

xx=1:size(ls,2)*4+1;
hl=fill([xx fliplr(xx)],[mm+ss fliplr(mm-ss)],'r');
set(hl,'edgealpha', 0, 'facealpha', 0.15);
clear out aa ss mm

yyaxis right
ylim([1.5 3.5])
set(gca,'yticklabel',[],'fontname','Arial','fontsize',10)

t1=nanmean(nanmean(tdsa(:,5)));
t2=nanmean(nanmean(tdsa(:,9)));
t3=nanmean(nanmean(tdsa(:,13)));

text(4.1,3.35,num2str(round(t1./10^5,2)),'color','r','fontname','Arial','fontsize',10,'fontweight','bold')
text(8.1,3.35,num2str(round(t2./10^5,2)),'color','r','fontname','Arial','fontsize',10,'fontweight','bold')
text(12.1,3.35,num2str(round(t3./10^5,2)),'color','r','fontname','Arial','fontsize',10,'fontweight','bold')
%% *** fig4c normalized TC heat potential anomaly & latent heat flux anomaly  ***
h3=subplot(2,2,3);set(h3,'pos',[0.1300    0.1500    0.3347    0.3412])
colororder([0 .45 .74;1 .25 .71])
yyaxis left
aa=ttchpa;
bb=std(aa,0,2);cc=mean(bb);
for kk=1:size(aa,1)
    out(kk,:)=aa(kk,:)./cc;
end
mm=mean(out,1);
ss=std(out,0,1)./sqrt(size(ttssta,1));

for ii=1:size(tdsa,1)
    [h1,p1,p2]=ttest(out(ii,:),mm,0.01);
    hh4(ii)=h1;
end

plot(mm','color',[0.00,0.45,0.74],'linestyle','-','linewidth',1.5);hold on
line([ls(end)+1 ls(end)+1],[-5 2.03],'color','b','linestyle','-.','linewidth',1);
line([ls(end)*3+1 ls(end)*3+1],[-5 2.03],'color','b','linestyle','-.','linewidth',1);
line([ls(end)*2+1 ls(end)*2+1],[-5 2.03],'color','b','linestyle','-.','linewidth',1);
ylim([-0.5 2.5])
xlim([1 size(tdsa,2)])
set(gca,'ytick',[-0.5:3/6:2.5],'yticklabel',[-0.5:3/6:2.5],'fontsize',10,'fontname','Arial')
set(gca,'xtick',[0:1:16],'xticklabel',{'','','','','','Genesis','','','','Peak','','','','Demise','',''},...
    'fontname','Arial','fontsize',10)
text(1,2.65,'c','fontname','Arial','fontsize',12,'fontweight','bold')
ylabel('(kJ\cdotcm^{-2})','fontname','Arial','fontsize',10)

xx=1:size(ls,2)*4+1;
hl=fill([xx fliplr(xx)],[mm+ss fliplr(mm-ss)],[0.00,0.45,0.74]);
set(hl,'edgealpha', 0, 'facealpha', 0.15);
clear out aa ss mm

yyaxis right
% lhf
aa=tlhfa;
bb=std(aa,0,2);cc=mean(bb);
for kk=1:size(aa,1)
    out(kk,:)=aa(kk,:)./cc;
end
mm=mean(out,1);
ss=std(out,0,1)./sqrt(size(ttssta,1));

for ii=1:size(tdsa,1)
    [h1,p1,p2]=ttest(out(ii,:),mm,0.01);
    hh2(ii)=h1;
end

plot(mm','color',[1 .25 .71],'linestyle','-','linewidth',1.5);hold on
xx=1:size(ls,2)*4+1;
h2=fill([xx fliplr(xx)],[mm+ss fliplr(mm-ss)],[1 .25 .71]);
set(h2,'edgealpha', 0, 'facealpha', 0.2);
ylim([-2.5 1.5])
set(gca,'ytick',[-2.5:4/4:1.5],'yticklabel',[-2.5:4/4:1.5],'fontsize',10,'fontname','Arial')

t1=nanmean(nanmean(ttchpa(:,5)));
t2=nanmean(nanmean(ttchpa(:,9)));
t3=nanmean(nanmean(ttchpa(:,13)));

text(4.2,1.3,num2str(round(t1,2)),'color',[0.00,0.45,0.74],'fontname','Arial','fontsize',10,'fontweight','bold')
text(8.3,1.3,num2str(round(t2,2)),'color',[0.00,0.45,0.74],'fontname','Arial','fontsize',10,'fontweight','bold')
text(12.2,1.3,num2str(round(t3,2)),'color',[0.00,0.45,0.74],'fontname','Arial','fontsize',10,'fontweight','bold')

t1=nanmean(nanmean(tlhfa(:,5)));
t2=nanmean(nanmean(tlhfa(:,9)));
t3=nanmean(nanmean(tlhfa(:,13)));

text(4.1,1.05,num2str(round(t1,2)),'color',[1 .25 .71],'fontname','Arial','fontsize',10,'fontweight','bold')
text(8.1,1.05,num2str(round(t2,2)),'color',[1 .25 .71],'fontname','Arial','fontsize',10,'fontweight','bold')
text(12.1,1.05,num2str(round(t3,2)),'color',[1 .25 .71],'fontname','Arial','fontsize',10,'fontweight','bold')
title('TCHP & LHF','fontname','Arial','fontsize',10)
ylabel('(W\cdotm^{-2})','fontname','Arial','fontsize',10)
%% *** fig4d normalized mixed layer depth anomaly  ***
h4=subplot(2,2,4);set(h4,'pos',[0.5894    0.1500    0.3347    0.3412])
% colororder([1 .64 0;0 0 0])
yyaxis left
aa=tmlda;
bb=std(aa,0,2);cc=mean(bb);
for kk=1:size(aa,1)
    out(kk,:)=aa(kk,:)./cc;
end
mm=mean(out,1);
ss=std(out,0,1)./sqrt(size(ttssta,1));

for ii=1:size(tdsa,1)
    [h1,p1]=ttest(out(ii,:),mm,0.01);
    hh5(ii)=h1;
end

plot(mm','color',[1 .76 .09],'linestyle','-','linewidth',1.5);hold on
line([ls(end)+1 ls(end)+1],[-5 0.76],'color','b','linestyle','-.','linewidth',1.2);
line([ls(end)*3+1 ls(end)*3+1],[-5 0.76],'color','b','linestyle','-.','linewidth',1.2);
line([ls(end)*2+1 ls(end)*2+1],[-5 0.76],'color','b','linestyle','-.','linewidth',1.2);
ylim([-1 1])
xlim([1 size(tdsa,2)])
set(gca,'ytick',[-1:2/4:1],'yticklabel',[-1:2/4:1],'fontsize',10,'fontname','Arial')
set(gca,'xtick',[0:1:16],'xticklabel',{'','','','','','Genesis','','','','Peak','','','','Demise','',''},...
    'fontname','Times New Roman','fontsize',10)
text(1,1.09,'d','fontname','Arial','fontsize',12,'fontweight','bold')
ylabel('(m)','fontname','Arial','fontsize',10)

xx=1:size(ls,2)*4+1;
hl=fill([xx fliplr(xx)],[mm+ss fliplr(mm-ss)],[1 .64 0]);
set(hl,'edgealpha', 0, 'facealpha', 0.18);
clear out aa ss mm

yyaxis right
ylim([-1 1.5])
set(gca,'yticklabel',[],'fontname','Arial','fontsize',10)

t1=nanmean(nanmean(tmlda(:,5)));
t2=nanmean(nanmean(tmlda(:,9)));
t3=nanmean(nanmean(tmlda(:,13)));

text(4.2,1.33,num2str(round(t1,2)),'color',[1 .64 0],'fontname','Arial','fontsize',10,'fontweight','bold')
text(8.2,1.33,num2str(round(t2,2)),'color',[1 .64 0],'fontname','Arial','fontsize',10,'fontweight','bold')
text(12.2,1.33,num2str(round(t3,2)),'color',[1 .64 0],'fontname','Arial','fontsize',10,'fontweight','bold')
title('MLD','fontname','Arial','fontsize',10)
% toc
% Elapsed time is 1.525481 seconds.
%%