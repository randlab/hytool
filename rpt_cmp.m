
% RPT_CMP
%
% Description: 
%   Internal script used for the ***_rpt functions.
%   It computes the drawdown, derivative and residuals of a given model.
%
% See also: rpt_lgd, rpt_llt, rpt_plt
%

func=[func,'_dim'];

% Keep only positive time
[t,s]=hyclean(t,s);

% Define regular points to plot the calculated drawdown
tc=logspace(log10(t(1)),log10(t(end)),length(t));

% Compute the drawdown with the model
sc=feval(func,p,tc);
% Keep only positive drawdown
[tc,sc]=hyclean(tc,sc);

% Compute the residuals and their statistics
residual=s-feval(func,p,t);
mr=mean(residual);
sr=2*std(residual);
rms=sqrt(mean(residual.^2));

