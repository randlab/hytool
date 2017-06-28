
% RPT_LGD
%
% Description: 
%   Internal script used for the RPT functions.
%   It writes the legend of the report.
%
% See also: rpt_cmp, rpt_llt, rpt_plt
%

clf
hax=axes('position',[0,0,1,1]);
set(hax,'Visible','off')

ht=text(0.1,0.43,lgdl); 
set(ht,'VerticalAlignment','top','HorizontalAlignment','left')
ht=text(0.5,0.4,lgdr); 
set(ht,'VerticalAlignment','top','HorizontalAlignment','left')

copyright=hycoop;

hc=text(0.9,0.05,copyright);
set(hc,'HorizontalAlignment','right','FontSize',8)

title(ttle)
xlabel('Time in seconds')
ylabel('Drawdown in meters')
hold off