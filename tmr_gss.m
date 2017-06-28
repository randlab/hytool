function p = tmr_gss( t, s )
% TMR_GSS - First guess for the parameters of the Theis model for multiple rate tests
%
% Syntax:  p = tmr_gss(t,s)
%
%   p(1) = b  = slope of Jacob straight line for late time = (0.183/T)
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of multiple rate test solution
%
% See also: tmr_dmo, tmr_dim, tmr_rpt, tmr_pre

global NBPUMPINGPERIOD BEGINTIME PUMPINGRATES QMATRIX

is=find(t<BEGINTIME(2));

if( max(size(is)) >=2 )
    n=round(is(end)./3);
    t=t(n:is(end));
    s=s(n:is(end));
    p=jcb_gss(t,s);
    p(1)=p(1)/PUMPINGRATES(1);
else
    [tb, sb] = birsoy_time( t, s, QMATRIX );
    p=jcb_gss(tb,sb);
end