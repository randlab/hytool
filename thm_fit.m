function p = thm_fit (Q,h0,r,s)
% Thiem pumping test evaluation for confined & unconfined aquifers
%
% Syntax: p = thm_fit( Q, h0, r, s )          
%   
%      Q      = pumping rate
%      h0     = initial thickness of unconfined aquifer; <=0: confined 
%      r,s    = data set
%  
%      p      = optimum parameter
%
% Description: The Thiem method is based on steady state drawdown observations
%   in at least two observation points. It can be applied for confined and 
%   unconfined aquifers. Only in the unconfined case the initial aquifer thickness 
%   is required. The confined case is indicated by setting the h0 input value <= 0.
%   Output parameter in the unconfined case is the hydraulic conductivity (m/s),
%   in the confined case the transmissivity (m2/s). 
%   
%   Distances of observation points and steady drawdowns are read from file.
%   The function optimizes the value of the model parameter so that
%   the model fits the observations. The fit is obtained by the analytical 
%   solution of the logarithmic least square procedure. 
%
% Ref.: https://www.researchgate.net/publication/299624782_Pumping_Test_Evaluation_
% using_Thiem_Equation_for_Steady-_state_Drawdown_in_Confined_and_Unconfined_Aquifers
%%
if h0 <= 0
    as = s;
else
    h = h0 - s;                             % observated steady state heads
    as = h.*h;
end
%%
n = length(r); lr = log(r);
B = (n*sum(lr.*as)-sum(lr)*sum(as))/(n*sum(lr.*lr)-sum(lr)^2);
A = (sum(as)-B*sum(lr))/n;
residual = as - A - B*lr;
mr=mean(residual);
sr=sqrt(mean(residual.^2));
norms = norm(residual);
rmax = max(r); rmin = min(r);
ar =logspace(log10(rmin),log10(rmax));
%%
% Defines the text of the left side of the legend 
lgdl=char('Test data:');
lgdl=char(lgdl, sprintf(' Discharge rate: %3.2e m^3/s',Q));
if h0 > 0 lgdl=char(lgdl, sprintf(' Initial thickness: %3.2e m',h0)); end
for j = 1:length(r)
    lgdl=char(lgdl, sprintf(' Distance to pumping well: %2g m',r(j)));
    lgdl=char(lgdl, sprintf(' Drawdown: %2g m',s(j))); 
end
lgdl=char(lgdl, 'Hydraulic parameters:');

% Defines the text of the right side of the legend 
lgdr=char('Thiem (1906) Model');
lgdr=char(lgdr, sprintf(' '));
lgdr=char(lgdr, 'Fitting parameters:');
lgdr=char(lgdr, sprintf(' mean residual: %0.2g m',mr));
lgdr=char(lgdr, sprintf(' 2 standard deviation: %0.2g m',sr));
ttle = 'Thiem Solution - fit acc. to Holzbecher';
if h0 <= 0
    T = -Q/2/pi/B; R = exp(2*pi*T*A/Q);
    lgdl=char(lgdl, sprintf(' Transmissivity T: %3.1e m^2/s',T));
    p = T;
else
    K = Q/pi/B; R = exp((h0*h0-A)*pi*K/Q);
    lgdl=char(lgdl, sprintf(' Conductivity K: %3.1e m/s',K));
    p = K;
end
lgdl=char(lgdl, sprintf(' Radius of investigation R: %3.1e m',R));
rpt_lgd
%%
xo=0.1; yo=0.5; dy=0.4; dx=0.8;
hax=axes('position',[xo,yo,dx,dy]);
if( size(r,1)==1 )
    r=r'; s=s';
end
if h0 <= 0
    loglog(r,s,'o',ar,A+B*log(ar),'-')
else
    loglog(r,s,'o',ar,h0-sqrt(A+B*log(ar)),'-')
end
% Defines the extension of the plot
yvec=[s];
ymin=min( yvec(yvec>0) )*0.8;
ymax=max([s])*1.2;
warning('off', 'all')
axis([rmin rmax ymin ymax])
warning('on', 'all')

% Write the legend
legend('Drawdown','Model')
xlabel('Distance in meters')
ylabel('Drawdown in meters')
