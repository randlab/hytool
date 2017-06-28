
% RPT_PLT
%
% Description: 
%   Internal script used for the RPT functions.
%   It plots the data and the model in log-log scale.
%
% See also: rpt_cmp, rpt_lgd, rpt_llt
%

% Selects the area for the plot and define a coordinate system
xo=0.1; yo=0.5;
dy=0.4; dx=0.8;
hax=axes('position',[xo,yo,dx,dy]);

if( size(t,1)==1 )
    t=t';
    s=s';
end
% Calculate the derivative of the data 
[td,sd]=ldiffs(t,s,30);
% Keep only positive derivatives
[td,sd]=hyclean(td,sd);

% Compute the derivative of the model
[tdc,sdc]=ldiff(tc,sc);
% Keep only positive derivatives
[tdc,sdc]=hyclean(tdc,sdc);

% Plots the data and model in bi-logarithmic scale
loglog(t,s,'o',td,sd,'+',tc,sc,'-',tdc,sdc,'-.')

% Defines the extension of the plot
yvec=[s;sd'];
ymin=min( yvec(yvec>0) )*0.8;
ymax=max([s;sd';sc';sdc'])*1.2;
warning('off', 'all')
axis([t(1) t(end) ymin ymax])
warning('on', 'all')

% Write the legend
legend('Drawdown','Derivative','Model','Model derivative','Location','Northwest')
xlabel('Time in seconds')
ylabel('Drawdown in meters')

% Add a title to the graph
title(ttle)