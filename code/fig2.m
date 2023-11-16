close all;clear all;clc;
%% *** fig2  Global TCs metrics during 1982-2021 *** 
% tic
load fig2.mat
% tcn2 - global annual averaged TCs number for all TCs, weak TCs and severe TCs during 1982-2021
% co_tc1 - the number of global zonally averaged compound severe TC and MHW (Co-STC-MHW) during 1982-2001
% co_tc2 - the number of global zonally averaged compound severe TC and MHW (Co-STC-MHW) during 2002-2021
% lat_p1 - the latitude of global TCs during 1982-2001
% lon_p1 - the longitude of global TCs during 1982-2001
% lat_p2 - the latitude of global TCs during 2002-2021
% lon_p2 - the longitude of global TCs during 2002-2021
% scal_p1 - the scale of global TCs during 1982-2001
% scal_p2 - the scale of global TCs during 2002-2021

%% *** fig2a 1982-2001 tc track and location ***
figure;set(gcf,'units','normalized','pos',[0.2745    0.2269    0.4500    0.4917])

clc;
h1=axes('pos',[0.1300    0.49    0.51    0.52]);

m_proj('miller','lon',[0 360],'lat',[-60 60]);hold on;
m_coast('patch',[0.8 0.8 0.8]);
m_grid('linestyle','none','box','on','tirkdir','in','fontname','Arial',...
'fontsize',9,...
'xtick',[0:60:360],'Xticklabel',[0:60:360],...
'ytick',[-60:20:60],'Yticklabel',[-60:20:60]);
m_text(3,65,'a','fontname','Arial','fontsize',12,'color','k','fontweight','bold');
title('1982-2001(P1)','fontname','Arial',...
'fontsize',10,'color','k');
m_text(23,53,'TC# 87.25/14.90','fontname','Arial',...
'fontsize',10,'color','k','backgroundcolor','w');

mm=1;nn=1;kk=1;rr=1;
for i=1:size(lon_p1,2)
    a=find(isnan(lon_p1(:,i))==0);
    for j=1:360
        if(scal_p1(j,i)==3);%cat3              
            lon3(mm)=lon_p1(j,i);lat3(mm)=lat_p1(j,i);mm=mm+1;
            elseif(scal_p1(j,i)==4);%cat4
                lon4(nn)=lon_p1(j,i);lat4(nn)=lat_p1(j,i);nn=nn+1;
                elseif(scal_p1(j,i)==5);%cat5
                    lon5(kk)=lon_p1(j,i);lat5(kk)=lat_p1(j,i);kk=kk+1;
        end
    end
    if (max(scal_p1(:,i))>=4);%cat3
        lon6(rr)=lon_p1(a(1),i);lat6(rr)=lat_p1(a(1),i);rr=rr+1;
    end
end

m_plot(lon_p1,lat_p1,'-','color','g');hold on
sa=7;
% m_scatter(lon3,lat3,sa,[1 0.84 0],'filled','o');hold on
m_scatter(lon4,lat4,sa,[1 0.84 0],'filled','o');hold on;
m_scatter(lon5,lat5,sa,'MarkerEdgeColor',[0.86 0.00 0.16],'MarkerFaceColor',[0.86 0.00 0.16]); hold on;
m_scatter(lon6,lat6,sa,'k','filled','o');   
m_coast('color','k');
clear lon4 lon5 lon6 lat4 lat5 lat6
%% *** fig2c 2002-2021 tc track and location ***
h3=axes('pos',[0.1300    0.08    0.51    0.52]); 

m_proj('miller','lon',[0 360],'lat',[-60 60]);hold on;
m_coast('patch',[0.8 0.8 0.8]);
m_grid('linestyle','none','box','on','tirkdir','in','fontname','Arial',...
'fontsize',9,...
'xtick',[0:60:360],'Xticklabel',[0:60:360],...
'ytick',[-60:20:60],'Yticklabel',[-60:20:60]);
m_text(3,65,'c','fontname','Arial','fontsize',12,'color','k','fontweight','bold');
title('2002-2021(P2)','fontname','Arial',...
'fontsize',10,'color','k');
m_text(23,53,'TC# 86.55/18.85','fontname','Arial',...
'fontsize',10,'color','k','backgroundcolor','w');

mm=1;nn=1;kk=1;rr=1;
for i=1:size(lon_p2,2)
    a=find(isnan(lon_p2(:,i))==0);
    for j=1:360
        if(scal_p2(j,i)==3);%cat3              
            lon3(mm)=lon_p2(j,i);lat3(mm)=lat_p2(j,i);mm=mm+1;
            elseif(scal_p2(j,i)==4);%cat4
                lon4(nn)=lon_p2(j,i);lat4(nn)=lat_p2(j,i);nn=nn+1;
                elseif(scal_p2(j,i)==5);%cat5
                    lon5(kk)=lon_p2(j,i);lat5(kk)=lat_p2(j,i);kk=kk+1;
        end
    end
    if (max(scal_p2(:,i))>=4);%cat3
        lon6(rr)=lon_p2(a(1),i);lat6(rr)=lat_p2(a(1),i);rr=rr+1;
    end
end

m_plot(lon_p2,lat_p2,'-','color','g');hold on
sa=7;
m_scatter(lon4,lat4,sa,[1 0.84 0],'filled','o'); %
m_scatter(lon5,lat5,sa,'MarkerEdgeColor',[0.86 0.00 0.16],'MarkerFaceColor',[0.86 0.00 0.16]); %
m_scatter(lon6,lat6,sa,'k','filled','o'); 

m_scatter(242,-20,60,'MarkerEdgeColor',[0.86 0.00 0.16],'MarkerFaceColor',[0.86 0.00 0.16])
m_text(248,-20,'Cat.5','FontName','Arial','FontSize',10)
m_scatter(242,-30,60,[1 0.84 0],'filled','o')
m_text(248,-30,'Cat.4','FontName','Arial','FontSize',10)
m_coast('color','k');
%% *** fig2b tc number during 1982-2001 & 2002-2021 ***
tca=tcn2(2,:)-tcn2(1,:);  % tc number

h2=axes('pos',[0.68    0.59    0.17    0.32]); hold on
colororder([0 .45 .74;0.86 0.00 0.16])

yyaxis left
tc=[tcn2(1,:);nan nan nan];
hb2=bar(tc);
ylim([-120 120])
set(hb2(1),'facecolor',[.93 .69 .13]);set(hb2(2),'facecolor',[0 .45 .74]);set(hb2(3),'facecolor',[.86 0 .16])

yyaxis right
tc=[nan nan nan; tca];
hb2=bar(tc);
ylim([-10 10])
set(hb2(1),'facecolor',[.93 .69 .13]);set(hb2(2),'facecolor',[0 .45 .74]);set(hb2(3),'facecolor',[.86 0 .16])
text(0.55,11.2,'b','fontname','Arial','fontsize',12,'fontweight','bold')
title('TCs #','fontname','Arial','fontsize',10)
set(gca,'xtick',[1:2],'xticklabel',{'P1','P2-P1'},'fontname','Arial','fontsize',9)
line([1.5 1.5],[-3.9 10],'color','k')
line([1.5 1.5],[-10 -8.8],'color','k')

hc=legend('All TCs','Weak TCs','Severe TCs','fontname','Arial','fontsize',8,'location','southwest');
set(hc,'box','off')
set(h2,'box','on')
clear h2 hb2 hc tc tca tcn2
%% *** fig2d zonally averaged Co_STC_MHW number ***
h4=axes('pos',[0.68    0.18    0.17    0.32])
y=-30:2:30;
plot(co_tc1,y,'color',[0 .45 .76],'linewidth',1.5);hold on
plot(co_tc2,y,'color',[1 .41 .16],'linewidth',1.5)
ylim([-30 30]);xlim([0 80])
set(gca,'xtick',[0:20:80],'xticklabel',[0:20:80],'ytick',[-30:5:30],'yticklabel',{'30°S','','20°S','','10°S','', ...
    '0°','','10°N','','20°N','','30°N'}, ...
    'fontsize',9,'fontname','Arial','yaxislocation','right')
text(0,34,'d','fontsize',12,'fontname','Arial','fontweight','bold');
legend('P1','P2','location','southeast','fontsize',10,'fontname','Arial')
legend('boxoff')
title('Co-STC-MHW #','fontsize',10,'fontname','Arial')
set(gca,'linewidth',1)
% toc
% Elapsed time is 6.459174 seconds.
%%