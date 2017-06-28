
% RPT_LLT
%
% Description: 
%   Internal script used for the RPT functions.
%   It plots the data and the model in semi log scale for slug tests.
%
% See also: rpt_cmp, rpt_lgd, rpt_plt
%

% Selects the area for the plot and define a coordinate system
xo=0.1; yo=0.5;
dy=0.4; dx=0.8;
hax=axes('position',[xo,yo,dx,dy]);

% Calculate the derivative of the data
[td,sd]=ldiffs(t,-s,30);
% Keep only positive derivatives
[td,sd]=hyclean(td,sd);

% Compute the derivative of the model
[tdc,sdc]=ldiff(tc,-sc);
% Keep only positive derivatives
[tdc,sdc]=hyclean(tdc,sdc);

% Plots the data and model in bi-logarithmic scale
semilogx(t,s,'o',td,sd,'+',tc,sc,'-',tdc,sdc,'-.')

% Defines the extension of the plot
yvec=[s;sd'];
%ymin=min( yvec(yvec>0) )*0.8;
ymin=0;
ymax=max([s;sd';sc';sdc']);
warning('off', 'all')
axis([t(1) t(end) 0 1])
warning('on', 'all')

% Write the legend
legend('Drawdown','Derivative','Model','Model derivative','Location','Northwest')
xlabel('Time in seconds')
ylabel('Relative drawdown')

% Add a title to the graph
title(ttle)