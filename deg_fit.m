function [T,c] = deg_fit (Q,rfit,sfit)
% de Glee pumping test evaluation for half confined aquifers
%
% Syntax: [T,c] = deg_fit( Q, rfit, sfit )          
%   
%      Q      = pumping rate [L^3/T]
%      rfit   = vector of distances to pumping well [L]
%      sfit   = vector of steady drawdown values [L] 
%      T      = optimum transmissivity [L^/T]
%      c      = optimum leaky parameter [T]
%
% Description: The de Glee method is based on steady state drawdown 
%   observations for at least two observation points. It can be applied for 
%   half-confined aquifers. Output parameters are the transmissivity and 
%   the resistance of the half-permeable layer. 
%   
%   Distances of observation points and steady drawdowns are read from file.
%   The function optimizes the value of the model parameters so that
%   the model fits the observations. The fit is obtained by an iterative
%   non linear least square procedure. The initial guess for transmissivity
%   is taken from the confined case. 
%
%   T indicates time unit, L space unit; here: T = second, L = meter
%
% Ref.:
% https://www.researchgate.net/publication/303238126_Pumping_Test_Evaluation_
%_using_the_deGlee_Equation_for_Steady-state_Drawdown_in_Half-Confined_Aquifers 
%%
n = length(rfit); lr = log(rfit);
T = (n*sum(lr.*sfit)-sum(lr)*sum(sfit))/(n*sum(lr.*lr)-sum(lr)^2);
T = -Q/2/pi/T;                       % transmissivity initial guess [L^2/T]
c = 86400e3;                         % resistance initial guess [T]
%%
options = optimset('Display','iter','FunValCheck','on','TolFun',1e-11);
v = [T,c];
v = fminsearch (@myfun,v,options,Q,rfit,sfit);
T = v(1); c = v(2);
s = Q/2/pi/T*besselk(0,rfit/sqrt(T*c));
residual = sfit-s;
mr=mean(residual);
sr=sqrt(mean(residual.^2));
norms = norm(residual);
r = logspace(log10(min(rfit)),log10(max(rfit)));
s = Q/2/pi/T*besselk(0,r/sqrt(T*c));
%%
% Defines the text of the left side of the legend 
lgdl=char('Test data:');
lgdl=char(lgdl, sprintf(' Discharge rate: %3.2e m^3/s',Q));
for j = 1:length(rfit)
    lgdl=char(lgdl, sprintf(' Distance to pumping well: %2g m',rfit(j)));
    lgdl=char(lgdl, sprintf(' Drawdown: %2g m',sfit(j)));
end
lgdl=char(lgdl, 'Hydraulic parameters:');

% Defines the text of the right side of the legend 
lgdr=char('de Glee (1930) Model');
lgdr=char(lgdr, sprintf(' '));
lgdr=char(lgdr, 'Fitting parameters:');
lgdr=char(lgdr, sprintf(' mean residual: %0.2g m',mr));
lgdr=char(lgdr, sprintf(' 2 standard deviation: %0.2g m',sr));
ttle = 'de Glee Solution - fit acc. to Holzbecher';
lgdl=char(lgdl, sprintf(' Transmissivity T: %3.1e m^2/s',T));
lgdl=char(lgdl, sprintf(' Resistance c: %3.1e s',c));
rpt_lgd
%%
xo=0.1; yo=0.5; dy=0.4; dx=0.8;
hax=axes('position',[xo,yo,dx,dy]);
as = Q/2/pi/T*besselk(0,r/sqrt(T*c));
loglog(rfit,sfit,'o',r,as,'-')
% Defines the extension of the plot
yvec=[s];
ymin=min( yvec(yvec>0) )*0.8;
ymax=max([s])*1.2;
warning('off', 'all')
axis([r(1) r(end) ymin ymax])
warning('on', 'all')
% Write the legend
legend('Drawdown','Model')
xlabel('Distance in meters')
ylabel('Drawdown in meters')

function f = myfun (v,Q,rfit,sfit)
T = v(1); c = v(2);
u = rfit/sqrt(T*c);
s = Q*besselk(0,u)/2/pi/T;
f = (s-sfit)*(s-sfit)';       % function f to be minimized
