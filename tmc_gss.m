function p = tmc_gss( t, s )
% TMC_GSS - First guess for the parameters of the Theis model with a constant head boundary for multiple rate tests
%
% Syntax:  p = tmc_gss(t,s)
%
%   p(1) = b  = slope of Jacob straight line for late time (= 0.183/T)
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%   p(3) = ti = time of intersection between the 2 straight lines
%
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of the Theis model with a constant head
%   boundary for multiple rate tests
%
% See also: tmc_dim, tmc_pre, tmc_rpt

global NBPUMPINGPERIOD BEGINTIME PUMPINGRATES QMATRIX

is=find(t<BEGINTIME(2));

if( max(size(is)) >=2 )
    n=round(is(end)./3);
    t=t(n:is(end));
    s=s(n:is(end));
    p=thc_gss(t,s);
    if p(3)>t(end)
        p(3)=0.9*t(end);
    end
    p=fit('thc',p,t,s);
    p(1)=p(1)/PUMPINGRATES(1);
else
    [tb, sb] = birsoy_time( t, s, QMATRIX );
    p=thc_gss(tb,sb);
    if p(3)>t(end)
        p(3)=0.9*t(end);
    end
    p=thc_fit(p,t,s);
end
